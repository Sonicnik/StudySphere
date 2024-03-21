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
        introPageType(name: "Welcome to StudySphere!",
                      description: "Welcome! StudySphere is an app helping students to organise tests, assignments, and more. Our app gives you only what’s necessary to do for each day, streamlining your planning process.",
                      imageUrl: "IntroPage1", tag: 0),
        introPageType(name: "Get started!",
                      description: "Select your subjects and avaliable time you have each day:",
                      imageUrl: "IntroPage2", tag: 1),
        introPageType(name: "Select subject", description: "subject", imageUrl: "a", tag: 2),
        introPageType(name: "Are you ready?", description: "So what are you waiting for? Let’s get started!",
                      imageUrl: "IntroPage3", tag: 3)
        
    ]
    
}

