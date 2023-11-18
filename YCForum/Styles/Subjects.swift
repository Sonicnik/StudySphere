//
//  Subjects.swift
//  YCForum
//
//  Created by Sonic Liu on 26/8/2023.
//

import SwiftUI

enum Subject: String, CaseIterable, Codable {
    case MATH
    case Chinese
    case English
    case Physics
    case CS
    case Economics
    case Chemistry
    case Business
    
    
    //Create a name variable within the subject to display on different pages as string title 
    var name: String {
        rawValue.capitalized
    }
}
extension Subject: Identifiable {
    var id: RawValue {
        rawValue
    }
}


