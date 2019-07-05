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
    
    var receiveMain: String = ""
    var receiveDate: String = ""
    var receiveSub: String = ""
    //var receiveTemp: String = ""
    var receiveTemp: Double = 0.0
    //var receiveHumidity: Int!
    var receiveImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main.text = receiveMain
        sub.text = receiveSub
        date.text = receiveDate
        //humidity.text = String(receiveHumidity)
        image.image = receiveImage
        temp.text = String(receiveTemp)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
