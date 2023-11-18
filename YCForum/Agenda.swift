//
//  YCForumApp.swift
//  YCForum
//
//  Created by Sonic Liu on 8/7/2023.
//

import SwiftUI

@main
struct Agenda: App {
    
    @StateObject private var info = storePageInfo()
    
    var body: some Scene {
        WindowGroup {
            Container()
        }
        
    }
}
