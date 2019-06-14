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

class FirstViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!

    let apiKey = "2a97a0fb261c0f493b1c1fbc319e49a8"
    let weatherUrl = "http://api.openweathermap.org/data/2.5/forecast"
    //let qiitaUrl = "http://qiita-stock.info/api.json"
    var items: [JSON] = []
    var cellItems = NSMutableArray()
    let cellNum = 10
    var selectedInfo : String?

    // MARK: - override functions
    override func viewDidLoad() {
        super.viewDidLoad()

        //debug
        self.label.text = "Hello World"
        print("new items")
        getData()
    }

    // MARK: - private functions
    // MARK: - 天気予報を取得
    private func getData() {

        Alamofire.request("http://api.openweathermap.org/data/2.5/forecast?id=1861835&APPID=2a97a0fb261c0f493b1c1fbc319e49a8")
            .responseJSON { response in print(response.result.value as Any) // テスト表示
        }
    }
    
    // セクション数を設定
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // 1セクションあたりの行数を設定
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellNum
    }
    
    
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
                    self.tableView.reloadData()
                    
                } catch let jsonError {
                    //print(jsonError.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    

}
