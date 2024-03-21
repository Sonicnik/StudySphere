//
//  Format.swift
//  YCForum
//
//  Created by Sonic Liu on 26/8/2023.
//

import SwiftUI

enum Format: String, CaseIterable, Codable {
    case homework = "Homework"
    case exam = "Exam"
    case test = "Test"
    case project = "Project"
    case event = "Event"
    case coursework = "Coursework"
    
    var localizedName: String {
        NSLocalizedString(self.rawValue + "-String", tableName: nil, bundle: .main, value: "**\(self.rawValue)**", comment: "")
    }
}


extension Format: Identifiable {
    var id:RawValue{
        rawValue
    }
}
