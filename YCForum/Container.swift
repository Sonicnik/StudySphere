
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
    @ObservedObject var saveSettings = SaveSettings()
    @ObservedObject private var avaliableTime = saveTime()
    @State var preIntro = false
    @State private var showIntroDelayed = false
    let defaults = UserDefaults.standard
    
    var body: some View {
        TabView {
            //Calendar
            CustomeCalendar()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            
            //Main
            Mainpage(info: $infoss.infoData, selectedSubject: $saveSettings.selectedSubject, preIntro: $preIntro, avaliableTime: $avaliableTime.avaliableTime){
            
            }
            .tabItem {
                Image(systemName: "tray.full")
                Text("ALL")
            }
            
            //Settings
            SettingPage(period: .constant([]), avaliableTime: $avaliableTime.avaliableTime, selectedSubject: $saveSettings.selectedSubject, preIntro: $preIntro)
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
            
            let storedVersion = defaults.string(forKey: "appVersion")
            let currentVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
            
            if let storedVersion = storedVersion, storedVersion == currentVersion {
                preIntro = false
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    preIntro = true
                }
                defaults.set(currentVersion, forKey: "appVersion")
            }
            
            
            
        }
        
        .sheet(isPresented: $preIntro) {
            introPages(preIntro: $preIntro,avaliableTime: $avaliableTime.avaliableTime, selectedSubject: $saveSettings.selectedSubject)
                .onDisappear{
                    defaults.set(false, forKey: "preIntro")
                }
            
        }
    }
}

struct Container_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
}
