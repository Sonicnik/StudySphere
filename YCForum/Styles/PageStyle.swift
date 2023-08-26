//
//  PageStyle.swift
//  
//
//  Created by Sonic Liu on 8/7/2023.
//

import Foundation

struct PageInfo: Identifiable {
    let id: UUID
    var title: String
    var publisher: String
    var detail: String
    var theme: Theme
    
    init(id: UUID = UUID(), title:String, publisher: String, detail: String, theme: Theme){
        self.id = id
        self.title = title
        self.publisher = publisher
        self.detail = detail
        self.theme = theme
    }
}

extension PageInfo {
    static var emptyPage: PageInfo {
        PageInfo(title: "", publisher: "", detail:"", theme: .sky)
    }

}


extension PageInfo {
    static let sampleData: [PageInfo] =
    [
        PageInfo(title: "Improve Network",
                 publisher: "Sonic",
                 detail: "Network is very slow in the campus, which limites our working efficiency.",
                 theme: .lavender),
        PageInfo(title: "Back to the old time table",
                 publisher: "Adam",
                 detail: "Most of the students still believe that the old time table with longer time for each class is better than the current one",
                 theme: .sky),
        PageInfo(title: "High priced canteen food",
                 publisher: "James",
                 detail: "The quality of food hasn't changed even though the price increases very semester, which doesn't make sense at all.",
                 theme: .indigo)]
}
