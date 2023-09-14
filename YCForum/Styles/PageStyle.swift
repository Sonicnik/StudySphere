//
//  PageStyle.swift
//  
//
//  Created by Sonic Liu on 8/7/2023.
//

import Foundation

struct PageInfo: Identifiable, Codable {
    let id: UUID
    var subject: Subject
    var format: Format
    var detail: String
    var theme: Theme
    var duedate: Date
    
    
    init(id: UUID = UUID(), subject: Subject, format: Format, detail: String, theme: Theme, duedate: Date){
        self.id = id
        self.subject = subject
        self.format = format
        self.detail = detail
        self.theme = theme
        self.duedate = duedate
    }
}

extension PageInfo {
    static var emptyPage: PageInfo {
        PageInfo(subject: .MATH, format: .Exam, detail:"", theme: .sky, duedate: Date())
    }

}


extension PageInfo {
    static let sampleData: [PageInfo] =
    [
        PageInfo(subject: .Chinese,
                 format: .Exam,
                 detail: "Paper 1 for 90mins",
                 theme: .lavender,
                 duedate: Date()),
        PageInfo(subject: .English,
                 format: .Homework,
                 detail: "Writing a reflection",
                 theme: .sky,
                 duedate: Date()),
        PageInfo(subject: .MATH,
                 format: .Test,
                 detail: "Unit1-3",
                 theme: .indigo,
                 duedate: Date())]
}
