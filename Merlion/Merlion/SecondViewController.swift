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

    override func viewDidLoad() {
        super.viewDidLoad()

        //setNotification()
    }

    @IBAction func tappedButton(_ sender: Any) {
        //setNotification()

        print("notification will be triggered in five seconds..Hold on tight")
        let content = UNMutableNotificationContent()
        content.title = "Intro to Notifications"
        content.subtitle = "Lets code,Talk is cheap"
        content.body = "Sample code from WWDC"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5.0, repeats: false)
        let request = UNNotificationRequest(identifier:"notificationid", content: content, trigger: trigger)

        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        UNUserNotificationCenter.current().add(request){(error) in

            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
}

