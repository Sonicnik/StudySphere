//
//  Subjects.swift
//  YCForum
//
//  Created by Sonic Liu on 26/8/2023.
//

import SwiftUI

enum Subject: String, CaseIterable, Codable {
    case Mathematics
    case Chinese = "Chinese L&L"
    case English = "English L&L"
    case Physics
    case CS = "Computer Science"
    case Economics
    case Chemistry
    case BM = "Business Management"
    case VA = "Visual Art"
    case DT = "Design & Technology"
    case Psychology
    case ESS = "Environmental Social Science"
    case TOK = "Theory of Knowledge"
    case CAS = "Creativity, Activity, Service"
    case EE = "Extended Essay"
    case Biology
    
    
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


