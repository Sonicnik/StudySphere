//
//  Subjects.swift
//  YCForum
//
//  Created by Sonic Liu on 26/8/2023.
//

import SwiftUI

enum Subject: String, CaseIterable, Codable {
    case Mathematics
    case Chinese
    case English
    case Physics
    case CS
    case Economics
    case Chemistry
    case BM
    case VA
    case DT
    case Psychology
    case ESS
    case TOK
    case CAS
    case EE
    case Biology
    case History
    case Geography
    case noChoice
    
    // Create a name variable within the subject to display on different pages as a localized string title
    var name: String {
        switch self {
        case .Mathematics:
            return NSLocalizedString("Subjects.Mathematics", comment: "Mathematics subject")
        case .Chinese:
            return NSLocalizedString("Subjects.Chinese", comment: "Chinese subject")
        case .English:
            return NSLocalizedString("Subjects.English", comment: "English subject")
        case .Physics:
            return NSLocalizedString("Subjects.Physics", comment: "Physics subject")
        case .CS:
            return NSLocalizedString("Subjects.CS", comment: "Computer Science subject")
        case .Economics:
            return NSLocalizedString("Subjects.Economics", comment: "Economics subject")
        case .Chemistry:
            return NSLocalizedString("Subjects.Chemistry", comment: "Chemistry subject")
        case .BM:
            return NSLocalizedString("Subjects.BM", comment: "Business Management subject")
        case .VA:
            return NSLocalizedString("Subjects.VA", comment: "Visual Arts subject")
        case .DT:
            return NSLocalizedString("Subjects.DT", comment: "Design Technology subject")
        case .Psychology:
            return NSLocalizedString("Subjects.Psychology", comment: "Psychology subject")
        case .ESS:
            return NSLocalizedString("Subjects.ESS", comment: "Environmental Systems and Societies subject")
        case .TOK:
            return NSLocalizedString("Subjects.TOK", comment: "Theory of Knowledge")
        case .CAS:
            return NSLocalizedString("Subjects.CAS", comment: "Creativity, Activity, Service")
        case .EE:
            return NSLocalizedString("Subjects.EE", comment: "Extended Essay")
        case .Biology:
            return NSLocalizedString("Subjects.Biology", comment: "Biology subject")
        case .History:
            return NSLocalizedString("Subjects.History", comment: "History subject")
        case .Geography:
            return NSLocalizedString("Subjects.Geography", comment: "Geography subject")
        case .noChoice:
            return NSLocalizedString("Subjects.noChoice", comment: "No choice selected")
        }
    }
}

extension Subject: Identifiable {
    var id: RawValue {
        rawValue
    }
}
