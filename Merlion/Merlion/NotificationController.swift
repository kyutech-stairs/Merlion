//
//  File.swift
//  Merlion
//
//  Created by 陰山賢太 on 2019/06/08.
//  Copyright © 2019 Kageken. All rights reserved.
//

import Foundation
import UserNotifications

//MARK: - 通知の作成
func setNotification(){
    //通知許可ダイアログの表示(最初に実行)
//    let center = UNUserNotificationCenter.current()
//    center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
//        print(error as Any)
//    }

    //通知内容の設定
    let content = UNMutableNotificationContent()
    content.title = "Title"
    content.subtitle = "subtitle"
    content.body = "Message"
    content.sound = UNNotificationSound.default

    //トリガーの設定
//    let formatter = DateFormatter()
//    var fireDate = DateComponents()
//    formatter.dateFormat = "HH"
//    fireDate.hour = Int(formatter.string(from: Date()))
//    formatter.dateFormat = "mm"
//    fireDate.minute = Int(formatter.string(from: Date()))
//    formatter.dateFormat = "ss"
//    fireDate.second = Int(formatter.string(from: Date()))! + 5
    let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: Double(10), repeats: true)

    //通知のリクエスト作成
    let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: trigger)

    //通知の登録
    let center = UNUserNotificationCenter.current()
    center.add(request) { (error) in
        if let error = error {
            print(error.localizedDescription)
        }
    }
}
