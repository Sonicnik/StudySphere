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
    
    func scheduleNotification(for work: PageInfo, at duedate: Date, subtitle description: String, identifier id: String) {
        
        //what to push in the notification
        let content = UNMutableNotificationContent()
        content.title = "There's more work😱"
        content.body = description
        content.sound = .default
        
        
        //Trigger of the notification
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: duedate)

        // Create a calendar trigger to schedule the notification at the due date and time
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

        
        //push request
        let request = UNNotificationRequest(identifier: id,
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error)")
                    }
                }
        
    }
    //func to update notification time
    func updateDueDate(forWork work: PageInfo, newDueDate: Date, subtitle description: String, identifier id: String) {
        let currentTime = Date()
        let newDueDate = work.duedate
        let timeUntilNewDueDate = newDueDate.timeIntervalSince(currentTime)

        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])

        
        

        // Schedule a new notification if the new due date is in the future
        if timeUntilNewDueDate > 0 {
            let content = UNMutableNotificationContent()
            content.title = "Work Due Soon"
            content.body = description

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeUntilNewDueDate, repeats: false)

            let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error)")
                }
            }
        }
    }






}
