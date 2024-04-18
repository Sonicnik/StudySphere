////
////  HiddenNotificationTrigger.swift
////  YCForum
////
////  Created by Sonic Liu on 11/12/2023.
////
//
//import Foundation
//import UserNotifications
//
//// For pushing notification to alert work hasn't finished yet
//extension NotificationManager {
//    func scheduleDailyNotificationForUnfinishedWork() {
//        let content = UNMutableNotificationContent()
//        content.title = "Unfinished Work Reminder"
//        content.body = "You still have tasks to be finished today."
//        
//        var dateComponents = Calendar.current.dateComponents([.hour, .minute], from: Date())
//        dateComponents.hour = 18 // 9 PM
//        dateComponents.minute = 27
//        
//        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//        
//        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["workUndoneDailyReminder"])
//        
//        let request = UNNotificationRequest(identifier: "workUndoneDailyReminder", content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("Error scheduling daily notification: \(error)")
//            }
//        }
//    }
//    
//    func sendDailyNotificationForUnfinishedWork(_ infos: [PageInfo]) {
//            
//            let unfinishedWork = infos.filter { pageInfo in
//                return !pageInfo.isDone && !pageInfo.isHidden
//            }
//            
//            if !unfinishedWork.isEmpty {
//                scheduleDailyNotificationForUnfinishedWork()
//            }
//        }
//}
//
//
//// for asking if there's new work should be added
//extension NotificationManager {
//    func askingNewWork() {
//        let content = UNMutableNotificationContent()
//        content.title = "New Assignments?"
//        content.body = "Add them to the StudySphere and get organized!"
//        
//        var dateComponents = Calendar.current.dateComponents([.hour, .minute], from: Date())
//        dateComponents.hour = 15
//        dateComponents.minute = 30
//        
//        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//        
//        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["dailyReminder"])
//        
//        let request = UNNotificationRequest(identifier: "dailyReminder", content: content, trigger: trigger)
//        
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("Error scheduling daily notification: \(error)")
//            }
//        }
//    }
//}
