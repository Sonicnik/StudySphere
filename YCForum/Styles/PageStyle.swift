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
    var publisher: String
    var detail: String
    var theme: Theme
    
    init(id: UUID = UUID(), subject: Subject, publisher: String, detail: String, theme: Theme){
        self.id = id
        self.subject = subject
        self.publisher = publisher
        self.detail = detail
        self.theme = theme
    }
}

extension PageInfo {
    static var emptyPage: PageInfo {
        PageInfo(subject: .MATH, publisher: "", detail:"", theme: .sky)
    }

}


extension PageInfo {
    static let sampleData: [PageInfo] =
    [
        PageInfo(subject: .Chinese,
                 publisher: "Sonic",
                 detail: "Network is very slow in the campus, which limites our working efficiency.",
                 theme: .lavender),
        PageInfo(subject: .English,
                 publisher: "Adam",
                 detail: "Most of the students still believe that the old time table with longer time for each class is better than the current one",
                 theme: .sky),
        PageInfo(subject: .MATH,
                 publisher: "James",
                 detail: "The quality of food hasn't changed even though the price increases very semester, which doesn't make sense at all.",
                 theme: .indigo)]
}
