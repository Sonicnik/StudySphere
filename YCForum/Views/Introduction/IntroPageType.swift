//
//  IntroPage.swift
//  YCForum
//
//  Created by Sonic Liu on 30/11/2023.
//

import Foundation

struct introPageType: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var sampleIntroPage = introPageType(name: "Example", description: "Description will appear in here", imageUrl: "LaunchScreen", tag: 0)
    
    static var PreIntroPage: [introPageType] =  [
        introPageType(name: "page1", description: "aaa", imageUrl: "LaunchScreen", tag: 0),
        introPageType(name: "page2", description: "bbb", imageUrl: "LaunchScreen", tag: 1),
        introPageType(name: "page3", description: "ccc", imageUrl: "LaunchScreen", tag: 2)
    ]
    
}

