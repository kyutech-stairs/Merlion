//
//  ViewController.swift
//  Merlion
//
//  Created by kageken, yone on 2019/06/06.
//  Copyright © 2019 Kageken. All rights reserved.
//

import UIKit
import UserNotifications

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityPicker: UIPickerView!

    //cityList = [["city name", "cist id"]]
    let cityList = [["札幌", "2128295"], ["仙台", "2111149"], ["新潟", "1855429"], ["東京", "1850147"], ["名古屋", "1856057"], ["京都", "1857910"], ["大阪", "1853909"], ["松江", "1857550"], ["山口", "1848681"], ["飯塚", "1861835"], ["沖縄", "1894616"]]
    
    //MARK: - override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        cityPicker.dataSource = self
        cityPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - Protocols
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityList[row][0]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.cityLabel.text = cityList[row][0]
        cityName = cityList[row][0]
        cityID = cityList[row][1]
    }

}
