
//  Created by Sonic Liu on 21/10/2023.
//
//  SelectionOFSubject.swift
//  YCForum
//
//  Created by Sonic Liu on 18/11/2023.
//

import SwiftUI

struct Container: View {
    @StateObject private var infoss = storePageInfo()
    @StateObject private var selectedSubject = SaveSettings()
    private var times = "1"
    let defaults = UserDefaults.standard
    
    var body: some View {
        TabView {
            Mainpage(info: $infoss.infoData, avaliableSubject: $selectedSubject.selectedSubject){
            
            }
            
            
            .tabItem {
                Image(systemName: "tray.full")
                Text("Today's")
            }
            
            SettingPage(period: .constant([]), avaliableTime: "1", selectedSubject: $selectedSubject.selectedSubject)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .onAppear {
            Task {
                do {
                    try await infoss.LoadInfo()
                } catch {
                    // Handle errors appropriately
                    print("Error loading data: \(error.localizedDescription)")
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
