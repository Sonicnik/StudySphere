//
//  PageStyle.swift
//  
//
//  Created by Sonic Liu on 8/7/2023.
//

import Foundation

struct PageInfo: Identifiable, Codable, Equatable {
    let id: String
    var title: String
    var subjects: Subject
    var formats: Format
    var detail: String
    var theme: Theme
    var duedate: Date
    var isDone: Bool
    var isHidden: Bool
    var eTime: Int
    
    
    init(id: String = UUID().uuidString,
         title: String,
         subjects: Subject,
         formats: Format,
         detail: String,
         theme: Theme,
         duedate: Date,
         isDone: Bool,
         isHidden: Bool,
         eTime: Int){
        self.id = id
        self.title = title
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
        PageInfo(title: "", subjects: .noChoice, formats: .exam, detail:"", theme: .sky, duedate: Date(), isDone: false, isHidden: false, eTime: 0)
    }

}


extension PageInfo {
    static let sampleData: [PageInfo] =
    [
        PageInfo(title: "Paper 1 Revision",
                 subjects: .Chinese,
                 formats: .exam,
                 detail: "90mins",
                 theme: .lavender,
                 duedate: Date(),
                 isDone: false,
                 isHidden: true,
                 eTime: 60),
                 
        PageInfo(title:"Writing a reflection",
                 subjects: .English,
                 formats: .homework,
                 detail: " ",
                 theme: .sky,
                 duedate: Date(),
                 isDone: true,
                 isHidden: false,
                 eTime: 45),
        
        PageInfo(title:"Test Revision",
                 subjects: .Mathematics,
                 formats: .test,
                 detail: "Unit1-3",
                 theme: .indigo,
                 duedate: Date(),
                 isDone: false,
                 isHidden: false,
                 eTime: 30)]
}
