//
//  PageStyle.swift
//  
//
//  Created by Sonic Liu on 8/7/2023.
//

import Foundation

struct PageInfo: Identifiable {
    let id: UUID
    var subject: Subject
    var format: Format
    var detail: String
    var theme: Theme
    
    init(id: UUID = UUID(), subject: Subject, format: Format, detail: String, theme: Theme){
        self.id = id
        self.subject = subject
        self.format = format
        self.detail = detail
        self.theme = theme
    }
}

extension PageInfo {
    static var emptyPage: PageInfo {
        PageInfo(subject: .MATH, format: .Exam, detail:"", theme: .sky)
    }

}


extension PageInfo {
    static let sampleData: [PageInfo] =
    [
        PageInfo(subject: .Chinese,
                 format: .Exam,
                 detail: "Network is very slow in the campus, which limites our working efficiency.",
                 theme: .lavender),
        PageInfo(subject: .English,
                 format: .Homework,
                 detail: "Most of the students still believe that the old time table with longer time for each class is better than the current one",
                 theme: .sky),
        PageInfo(subject: .MATH,
                 format: .Test,
                 detail: "The quality of food hasn't changed even though the price increases very semester, which doesn't make sense at all.",
                 theme: .indigo)]
}
