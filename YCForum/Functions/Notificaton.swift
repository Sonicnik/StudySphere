//
//  Notificaton.swift
//  YCForum
//
//  Created by Sonic Liu on 24/9/2023.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let option: UNAuthorizationOptions = [.alert, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: option) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        
        //what to push in the notification
        let content = UNMutableNotificationContent()
        content.title = "This is a notification!"
        content.subtitle = "This was soooo easy!"
        content.sound = .default
        
        
        //Trigger of the notification
        var dateComponents = DateComponents()
        dateComponents.hour = 11
        dateComponents.minute = 06
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        //push request
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        
    }
}
