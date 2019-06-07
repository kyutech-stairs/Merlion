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

    @IBOutlet weak var label: UILabel!

    let apiKey = "2a97a0fb261c0f493b1c1fbc319e49a8"
    let weatherUrl = "http://api.openweathermap.org/data/2.5/forecast"
    //let qiitaUrl = "http://qiita-stock.info/api.json"
    var items: [JSON] = []

    //MARK: - override functions
    override func viewDidLoad() {
        super.viewDidLoad()

        //debug
        self.label.text = "Hello World"
        print("new items")
        getData()
    }

    //MARK: - private functions
    //MARK: - 天気予報を取得
    private func getData() {
        //FIXME: - idベタ書きなので後で修正
        Alamofire.request("http://api.openweathermap.org/data/2.5/forecast?id=1861835&APPID=2a97a0fb261c0f493b1c1fbc319e49a8").responseJSON { response in
            print(response.result.value as Any) // テスト表示
        }
    }

}
