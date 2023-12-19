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
                      description: "Welcome! StudySphere is an app helping IB students organise tests, assignments, and more. Our app gives you only what’s necessary to do for each day, helping you on your IB journey.",
                      imageUrl: "IntroPage1", tag: 0),
        introPageType(name: "What to start?",
                      description: "To set up, please go to the setting page (click the tab at the bottom). Select your subjects and how much time you have per day. Then the good part: add all your assignments and tests via the home page, and stress no more.",
                      imageUrl: "IntroPage2", tag: 1),
        introPageType(name: "Are you ready?", description: "So what are you waiting for? Let’s get started!",
                      imageUrl: "IntroPage3", tag: 2)
    ]
    
}

