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
    
    let weatherUrl = "http://api.openweathermap.org/data/2.5/forecast"
    var weatherData: [[String: String?]] = [] // 天気データを入れるプロパティを定義
    
    var giveWeather: String = "" // segue時に渡す変数
    var giveDate: String = "" // segue時に渡す変数

    
    // MARK: - override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "weather forecast"
        let id = "1861835" // 飯塚市のID
        getData(cityID: id)
    }
    
    // MARK: - 更新
    @IBAction func reloadButton(_ sender: Any) {
        let id2 = "6455259" // パリのID
        getData(cityID: id2)
    }
    
    // MARK: - セルの数を取得
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    // MARK: - セルのカスタマイズ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let weather = weatherData[indexPath.row]
        cell.textLabel?.text = weather["description"]!
        cell.detailTextLabel?.text = weather["date"]!
        return cell
    }
    
    //MARK: - 天気予報を取得
    private func getData(cityID: String) {
        weatherData = [] // 初期化
    
        if let APIKEY = KeyManager().getValue(key: "apiKey") as? String {
            Alamofire.request("http://api.openweathermap.org/data/2.5/forecast?id=\(cityID)&APPID=\(APIKEY)").responseJSON { response in
                //print(response.result.value as Any)
                guard let object = response.result.value else {
                    return
                }
                
                let json = JSON(object) // JSON型
                let dataNum: Int = json["list"].count // listのデータ数をカウントしてdataNumに格納
                print(dataNum) // listのデータ数表示
                
                for i in 0 ..< dataNum { // weatherDataに天気データを格納
                    let weatherData: [String: String?] = [
                        "description": json["list"][i]["weather"][0]["description"].string,
                        "date": json["list"][i]["dt_txt"].string
                    ]
                    self.weatherData.append(weatherData) // 配列に要素を追加
                }
                self.tableView.reloadData() // 描画処理
            }
        }
    }
    
    //MARK: - 任意のセルが押された時
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weather = weatherData[indexPath.row] // 押されたセルのデータをweatherに格納
        giveWeather = weather["description"]!!
        giveDate = weather["date"]!!
        performSegue(withIdentifier: "toDetail", sender: nil) // "Segue"を使った画面遷移を行う関数
    }
    
    //MARK: - segueを検知
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else { // エラー処理
            return
        }
        if segue.identifier == "toDetail" { // "toDetail"を検知した時
            let vc = segue.destination as! DetailViewController // 遷移先のViewControllerを設定
            vc.receiveWeather = giveWeather
            vc.receiveDate = giveDate
        }
    }
    
    //MARK: - 警告時メモリ解放
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
