//
//  Setinfo.swift
//  YCForum
//
//  Created by Sonic Liu on 21/10/2023.
//

import Foundation


struct PeriodInfo: Identifiable, Codable {
    let id: String
    var startTime: Int
    var endTime: Int
    var dayAt: Int
    
    init(id: String = UUID().uuidString, startTime: Int, endTime: Int, dayAt: Int) {
        self.id = id
        self.startTime = startTime
        self.endTime = endTime
        self.dayAt = dayAt
    }
}

extension PeriodInfo {
    static let samplePeriods: [PeriodInfo] =
    [
        
        PeriodInfo(startTime: 7, endTime: 9, dayAt: 1),
        PeriodInfo(startTime: 12, endTime: 15, dayAt: 6),
        PeriodInfo(startTime: 16, endTime: 18, dayAt: 7)

    ]
}
