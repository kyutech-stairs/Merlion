//
//  ViewController.swift
//  Merlion
//
//  Created by kageken, yone on 2019/06/06.
//  Copyright © 2019 Kageken. All rights reserved.
//

import UIKit
import UserNotifications

class SecondViewController: UIViewController {

    @IBOutlet weak var picker: UIDatePicker!

    //MARK: - override functions
    override func viewDidLoad() {
        super.viewDidLoad()

        //setNotification()
    }

    //MARK: - Actions
    @IBAction func tappedButton(_ sender: Any) {
        //setNotification()

        print("notification is fire")

        //通知内容を設定
        let content = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "subtitle"
        content.body = "message"
        content.sound = UNNotificationSound.default

        //通知するタイミングを設定
        var fireDate = DateComponents()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        fireDate.hour = Int(formatter.string(from: picker.date))
        formatter.dateFormat = "mm"
        fireDate.minute = Int(formatter.string(from: picker.date))
        fireDate.second = 0

        //発火!!!!!
        //let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 10.0, repeats: false)
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: fireDate, repeats: false)
        let request = UNNotificationRequest(identifier:"notificationid", content: content, trigger: trigger)

        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        UNUserNotificationCenter.current().add(request){(error) in

            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
}

