//
//  PageStyle.swift
//  
//
//  Created by Sonic Liu on 8/7/2023.
//

import Foundation

struct PageInfo: Identifiable, Codable, Equatable {
    let id: String
    var subjects: Subject
    var formats: Format
    var detail: String
    var theme: Theme
    var duedate: Date
    var isDone: Bool
    var isHidden: Bool
    var eTime: Int
    
    
    init(id: String = UUID().uuidString, subjects: Subject, formats: Format, detail: String, theme: Theme, duedate: Date, isDone: Bool, isHidden: Bool, eTime: Int){
        self.id = id
        self.subjects = subjects
        self.formats = formats
        self.detail = detail
        self.theme = theme
        self.duedate = duedate
        self.isDone = isDone
        self.isHidden = isHidden
        self.eTime = eTime
    }
}

extension PageInfo {
    static var emptyPage: PageInfo {
        PageInfo(subjects: .Mathematics, formats: .Exam, detail:"", theme: .sky, duedate: Date(), isDone: false, isHidden: false, eTime: 0)
    }

}


extension PageInfo {
    static let sampleData: [PageInfo] =
    [
        PageInfo(subjects: .Chinese,
                 formats: .Exam,
                 detail: "Paper 1 for 90mins",
                 theme: .lavender,
                 duedate: Date(),
                 isDone: false,
                 isHidden: true,
                 eTime: 60),
                 
        PageInfo(subjects: .English,
                 formats: .Homework,
                 detail: "Writing a reflection",
                 theme: .sky,
                 duedate: Date(),
                 isDone: true,
                 isHidden: false,
                 eTime: 45),
        
        PageInfo(subjects: .Mathematics,
                 formats: .Test,
                 detail: "Unit1-3",
                 theme: .indigo,
                 duedate: Date(),
                 isDone: false,
                 isHidden: false,
                 eTime: 30)]
}
