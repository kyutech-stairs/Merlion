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

class FirstViewController: UITableViewController {
    let table = UITableView() // プロパティにtableを追加

    let weatherUrl = "http://api.openweathermap.org/data/2.5/forecast"
    //var items: [JSON] = []
    var cellItems = NSMutableArray()
    let cellNum = 10
    var selectedInfo : String?

    // MARK: - override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "天気一覧"

        //debug
        print("new items")
        let id = "1861835" // 飯塚市のID

        getData(cityID: id)
        //makeTableData()
        
        table.frame = view.frame // tableの大きさをviewの大きさに合わせる
        view.addSubview(table) // viewにtableを合わせる
    }

    //MARK: - private functions
    //MARK: - 天気予報を取得
    private func getData(cityID: String) {
    
        if let APIKEY = KeyManager().getValue(key: "apiKey") as? String {
            Alamofire.request("http://api.openweathermap.org/data/2.5/forecast?id=\(cityID)&APPID=\(APIKEY)").responseJSON { response in
                guard let object = response.result.value else {
                    return
                }
                
                let json = JSON(object)
                json.forEach { (_, json) in
                    print(json[weather.description].string)
                }
            }
        }
    }
    
    
    
    
    
    /*
    
    // セクション数を設定
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // 1セクションあたりの行数を設定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellNum
    }
    
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
