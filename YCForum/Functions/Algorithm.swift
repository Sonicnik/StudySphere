//
//  Algorithm.swift
//  YCForum
//
//  Created by Sonic Liu on 30/10/2023.
//

import SwiftUI

extension PageInfo {
    func scheduleTasks(_ tasks: [Task], availableTimePerDay: Int) -> [String] {
        var scheduledTasks: [String] = []
        
        let sortedTasks = tasks.sorted { (task1, task2) in
            if task1.dueDate == task2.dueDate {
                return task1.priority > task2.priority
            }
            return task1.dueDate < task2.dueDate
        }
        
        var remainingTime = availableTimePerDay
        
        for task in sortedTasks {
            if remainingTime >= task.estimatedTime {
                scheduledTasks.append("\(task.name) - Due: \(task.dueDate)")
                remainingTime -= task.estimatedTime
            } else {
                // Not enough time in the current day, check the next day
                // You can implement a logic to check multiple days if needed
                continue
            }
        }
        
        if scheduledTasks.isEmpty {
            scheduledTasks.append("No tasks scheduled for today.")
        }
        
        return scheduledTasks
    }
}
