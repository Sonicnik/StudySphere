//
//  Format.swift
//  YCForum
//
//  Created by Sonic Liu on 26/8/2023.
//

import SwiftUI

enum Format: String, CaseIterable, Codable {
    case homework
    case exam
    case test
    case project
    case event
    case coursework
    case customize
    
    var localizedName: String {
        switch self {
        case .homework:
            return NSLocalizedString("Format.homework", comment: "Homework format")
        case .exam:
            return NSLocalizedString("Format.exam", comment: "Exam format")
        case .test:
            return NSLocalizedString("Format.test", comment: "Test format")
        case .project:
            return NSLocalizedString("Format.project", comment: "Project format")
        case .event:
            return NSLocalizedString("Format.event", comment: "Event format")
        case .coursework:
            return NSLocalizedString("Format.coursework", comment: "Coursework format")
        case .customize:
            return NSLocalizedString("Format.Customize", comment: "Customizable format")
        }
    }
}

extension Format: Identifiable {
    var id: RawValue {
        rawValue
    }
}
