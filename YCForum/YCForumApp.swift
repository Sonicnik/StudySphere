//
//  YCForumApp.swift
//  YCForum
//
//  Created by Sonic Liu on 8/7/2023.
//

import SwiftUI

@main
struct YCForumApp: App {
    @State private var info = PageInfo.sampleData
    var body: some Scene {
        WindowGroup {
            Mainpage(info: $info)
        }
    }
}
