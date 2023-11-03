//
//  Algorithm.swift
//  YCForum
//
//  Created by Sonic Liu on 30/10/2023.
import Foundation

extension PageInfo {
    static func scheduleTasks( tasks: [PageInfo]) -> [PageInfo] {
//        var scheduledTasks: [PageInfo] = []
        var sortedTasks = tasks

        var i = sortedTasks.count - 1
            while(i > 0) {
                var j = 0
                while(j < i) {
                    if sortedTasks[j].duedate > sortedTasks[j + 1].duedate {
                        sortedTasks.swapAt(j, j + 1)
                    }
                    j += 1
                }
                i -= 1
            }
//
//        var remainingTime = availableTimePerDay

//        for task in sortedTasks {
//            if remainingTime >= task.estimatedTime {
//                scheduledTasks.append(task)
//                remainingTime -= task.estimatedTime
//            } else {
//                // Not enough time in the current day, check the next day
//                // You can implement a logic to check multiple days if needed
//                continue
//            }
//        }

        return sortedTasks
    }
}
