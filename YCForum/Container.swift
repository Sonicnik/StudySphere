//
//  Container.swift
//  YCForum
//
//  Created by Sonic Liu on 21/10/2023.
//

import SwiftUI

struct Container: View {
    @StateObject private var info = storePageInfo()
    @StateObject private var selectedSubject = SaveSettings()
    
    var body: some View {
        TabView {
            Mainpage(info: $info.info, avaliableSubject: $selectedSubject.selectedSubjects){ }
            .tabItem {
                Image(systemName: "tray.full")
                Text("Today's")
            }

            SettingPage(period: .constant([]), avaliableTime: "1", selectedSubject: $selectedSubject.selectedSubjects)
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        .onAppear {
            Task {
                do {
                    try await info.LoadInfo()
                } catch {
                    // Handle errors appropriately
                    print("Failed to load info: \(error)")
                }
            }
        }
    }
}

struct Container_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
}
