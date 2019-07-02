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
    
    var receiveMain: String = ""
    var receiveDate: String = ""
    var receiveSub: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        main.text = receiveMain
        sub.text = receiveSub
        date.text = receiveDate
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
