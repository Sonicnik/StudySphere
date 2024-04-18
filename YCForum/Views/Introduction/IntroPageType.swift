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
    
    static var sampleIntroPage = introPageType(name: NSLocalizedString("IntroPage.Example-String", comment: "Example intro page name"),
                                               description: NSLocalizedString("IntroPage.ExampleDesc-String", comment: "Example intro page description"),
                                               imageUrl: "LaunchScreen",
                                               tag: 0)
    
    static var PreIntroPage: [introPageType] = [
        introPageType(name: NSLocalizedString("IntroPage.Welcome-String", comment: "Welcome intro page name"),
                      description: NSLocalizedString("IntroPage.WelcomeDesc-String", comment: "Welcome intro page description"),
                      imageUrl: "IntroPage1",
                      tag: 0),
        introPageType(name: NSLocalizedString("IntroPage.GetStarted-String", comment: "Get started intro page name"),
                      description: NSLocalizedString("IntroPage.GetStartedDesc-String", comment: "Get started intro page description"),
                      imageUrl: "IntroPage2",
                      tag: 1),
        introPageType(name: NSLocalizedString("IntroPage.SelectSubject-String", comment: "Select subject intro page name"),
                      description: NSLocalizedString("IntroPage.SelectSubjectDesc-String", comment: "Select subject intro page description"),
                      imageUrl: "a",
                      tag: 2),
        introPageType(name: NSLocalizedString("IntroPage.Ready-String", comment: "Ready intro page name"),
                      description: NSLocalizedString("IntroPage.ReadyDesc-String", comment: "Ready intro page description"),
                      imageUrl: "IntroPage3",
                      tag: 3)
    ]
}
