//
//  DetailViewController.swift
//  Merlion
//
//  Created by Koichi Yoneshiro on 2019/06/24.
//  Copyright © 2019 Kageken. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var receiveWeather: String = ""
    var receiveDate: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather.text = receiveWeather
        date.text = receiveDate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
