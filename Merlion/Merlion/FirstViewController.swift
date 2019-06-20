//
//  FirstViewController.swift
//  Merlion
//
//  Created by Koichi Yoneshiro on 2019/06/06.
//  Copyright © 2019 Kageken. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FirstViewController: UIViewController, UITableViewDataSource {
    let table = UITableView() // プロパティにtableを追加
    let weatherUrl = "http://api.openweathermap.org/data/2.5/forecast"
    var weatherData: [[String: String?]] = [] // 天気データを入れるプロパティを定義

    // MARK: - override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "天気予報"
        let id = "1861835" // 飯塚市のID

        getData(cityID: id)
        
        table.frame = view.frame // tableの大きさをviewの大きさに合わせる
        view.addSubview(table) // viewにtableを合わせる
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let weather = weatherData[indexPath.row]
        cell.textLabel?.text = weather["description"]!
        cell.detailTextLabel?.text = weather["date"]!
        return cell
    }
    
    

    //MARK: - private functions
    //MARK: - 天気予報を取得
    private func getData(cityID: String) {
    
        if let APIKEY = KeyManager().getValue(key: "apiKey") as? String {
            Alamofire.request("http://api.openweathermap.org/data/2.5/forecast?id=\(cityID)&APPID=\(APIKEY)").responseJSON { response in
                print(response.result.value as Any) // データ全取得.responseのresultプロパティのvalueプロパティをコンソールに出力
                guard let object = response.result.value else {
                    return
                }
                
                let json = JSON(object) // JSON型
                let dataNum: Int = json["list"].count // listのデータ数をカウント
                print(dataNum) // listのデータ数表示
                
                for i in 0 ..< dataNum {
                    //print(json["list"][i]["dt_txt"].string as Any)
                    //print(json["list"][i]["weather"][0]["description"].string as Any)
                    let weatherData: [String: String?] = [
                        "date": json["list"][i]["dt_txt"].string,
                        "description": json["list"][i]["weather"][0]["description"].string
                    ]
                    self.weatherData.append(weatherData)
                }
                self.table.reloadData()
            }
        }
    }
    
    
    
    
    
    /*
    
    // cellにテスト表示を突っ込む
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if self.cellItems.count > 0 {
            cell.textLabel?.text = self.cellItems[indexPath.row] as? String
        }
        return cell
    }
    
    // APIをたたいて、配列に保存する
    // 非同期でAPIを叩いている
    func makeTableData() {
        let url = URL(string: self.weatherUrl)!
        let task = URLSession.shared.dataTask(with: url){(data, responce, error) in
            if error == nil {
                do {
                    // リソースの取得が終わると、ここに書いた処理が実行される
                    let json = try JSON(data: data!)
                    // 各セルに情報を突っ込む
                    for i in 0 ..< self.cellNum {
                        let dt_txt = json["list"][i]["dt_txt"]
                        let weatherMain = json["list"][i]["weather"][0]["main"]
                        let weatherDescription = json["list"][i]["weather"][0]["description"]
                        let info = "\(dt_txt), \(weatherMain), \(weatherDescription)"
                        print(info)
                        self.cellItems[i] = info
                    }
                    if Thread.isMainThread {
                        self.tableView.reloadData()
                    }
                } catch _ {
                    //print(jsonError.localizedDescription)
                }

            }
        }
        task.resume()
    }
     */
    
}
