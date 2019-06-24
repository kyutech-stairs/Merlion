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
    
    var giveWeather: String = ""
    var giveDate: String = ""

    // MARK: - override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "weather forecast"
        let id = "1861835" // 飯塚市のID

        print(id)
        getData(cityID: id)
    }
    
    // MARK: - 更新
    @IBAction func reloadButton(_ sender: Any) {
        viewDidLoad()
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
    
    //MARK: - private functions
    //MARK: - 天気予報を取得
    private func getData(cityID: String) {
    
        if let APIKEY = KeyManager().getValue(key: "apiKey") as? String {
            Alamofire.request("http://api.openweathermap.org/data/2.5/forecast?id=\(cityID)&APPID=\(APIKEY)").responseJSON { response in
                //print(response.result.value as Any) // データ全取得.responseのresultプロパティのvalueプロパティをコンソールに出力
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
                    self.weatherData.append(weatherData)
                }
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weather = weatherData[indexPath.row]
        giveWeather = weather["description"]!!
        giveDate = weather["date"]!!
        performSegue(withIdentifier: "Segue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else {
            return
        }
        if segue.identifier == "Segue" {
            let vc = segue.destination as! DetailViewController
            vc.receiveWeather = giveWeather
            vc.receiveDate = giveDate
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
