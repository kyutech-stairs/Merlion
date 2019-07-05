//
//  DetailViewController.swift
//  Merlion
//
//  Created by Koichi Yoneshiro on 2019/06/24.
//  Copyright © 2019 Kageken. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var main: UILabel!
    @IBOutlet weak var sub: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var humidity: UILabel!
    
    var receiveMain: String = ""
    var receiveDate: String = ""
    var receiveSub: String = ""
    var receiveTemp: Double = 0.0
    var receiveHumidity: Int = 0
    var receiveImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main.text = receiveMain
        sub.text = receiveSub
        date.text = receiveDate
        temp.text = String(format: "%.f度", receiveTemp)
        humidity.text = String(format: "%d度", receiveHumidity)
        image.image = receiveImage
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
