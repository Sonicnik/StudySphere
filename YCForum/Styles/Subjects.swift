//
//  Subjects.swift
//  YCForum
//
//  Created by Sonic Liu on 26/8/2023.
//

import SwiftUI

enum Subject: String, CaseIterable, Codable {
    case Mathematics = "Subjects.Mathematics-String"
    case Chinese = "Subjects.chinese-String"
    case English = "Subjects.english-String"
    case Physics = "Subjects.physics-String"
    case CS = "Subjects.cs-String"
    case Economics = "Subjects.economics-String"
    case Chemistry = "Subjects.chemistry-String"
    case BM = "Subjects.bm-String"
    case VA = "Subjects.va-String"
    case DT = "Subjects.dt-String"
    case Psychology = "Subjects.psychology-String"
    case ESS = "Subjects.ess-String"
    case TOK = "ToK"
    case CAS = "C A S"
    case EE = "Extended Essay"
    case Biology = "Subjects.biology-String"
    case History = "Subjects.history-String"
    case Geography = "Subjects.geography-String"
    case noChoice = "Subjects.noChoice-String"
    
    
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


