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
        // Calculate the adjusted due date (one day before the original due date)
        let oneDayInSeconds: TimeInterval = 24 * 60 * 60 // One day in seconds
        let adjustedDueDate = duedate.addingTimeInterval(-oneDayInSeconds)

        // Calculate the time interval between the adjusted due date and the current time
        let currentTime = Date()
        let timeUntilAdjustedDueDate = adjustedDueDate.timeIntervalSince(currentTime)

        // Check if the adjusted due date is still in the future
        if timeUntilAdjustedDueDate > 0 {
            // Create content for the notification
            let content = UNMutableNotificationContent()
            content.title = "Due Date Coming😱"
            content.body = description
            content.sound = .default

            // Create a calendar trigger for the adjusted due date
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: adjustedDueDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)

            // Schedule the notification with the adjusted due date and provided identifier
            let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error)")
                }
            }
        }
    }

    //func to update notification time
    func updateDueDate(for work: PageInfo, newDueDate: Date, subtitle description: String, identifier id: String) {
        let currentTime = Date()
        let newDueDate = work.duedate
        let oneDayInSeconds: TimeInterval = 24 * 60 * 60 // One day in seconds
        let adjustedDueDate = newDueDate.addingTimeInterval(-oneDayInSeconds)
        let timeUntilNewDueDate = adjustedDueDate.timeIntervalSince(currentTime)

        
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
