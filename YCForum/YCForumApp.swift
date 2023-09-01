//
//  YCForumApp.swift
//  YCForum
//
//  Created by Sonic Liu on 8/7/2023.
//

import SwiftUI

@main
struct YCForumApp: App {
    
    @StateObject private var info = storeData()
    
    var body: some Scene {
        WindowGroup {
            Mainpage(info: $info.info){
                Task {
                    do {
                        try await info.save(infos: info.info)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            
            .task {
                do {
                    try await info.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
        
    }
}
