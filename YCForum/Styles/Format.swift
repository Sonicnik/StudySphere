//
//  Format.swift
//  YCForum
//
//  Created by Sonic Liu on 26/8/2023.
//

import SwiftUI

enum Format: String, CaseIterable, Codable {
    case Homework
    case Exam
    case Test
    case Project
    case Event
    
    var name: String {
        rawValue.capitalized
    }
    
}

extension Format: Identifiable {
    var id:RawValue{
        rawValue
    }
}
