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

    var items: [JSON] = []

    //MARK: - override functions
    override func viewDidLoad() {
        super.viewDidLoad()

        //debug
        self.label.text = "Hello World"
        print("new items")
        let id = "1861835" // 飯塚市のID

        getData(cityID: id)
    }

    //MARK: - private functions
    //MARK: - 天気予報を取得
    private func getData(cityID: String) {

        if let APIKEY = KeyManager().getValue(key: "apiKey") as? String {
            Alamofire.request("http://api.openweathermap.org/data/2.5/forecast?id=\(cityID)&APPID=\(APIKEY)").responseJSON { response in
                print(response.result.value as Any) // テスト表示
            }
        }
    }

}
