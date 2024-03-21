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
    @State private var extractedPageInfos: [PageInfo] = []
    let defaults = UserDefaults.standard
    
    var body: some View {
        TabView {
            //Calendar
            CustomeCalendar(info: $infoss.infoData, saveAction: {})
                .tabItem {
                    Image(systemName: "calendar")
                    Text(NSLocalizedString("Container.Calendar-String", comment: "Calendar tab title"))
                }
            
            //Main
            Mainpage(info: $extractedPageInfos, metapageinfo: $infoss.infoData ,selectedSubject: $saveSettings.selectedSubject, preIntro: $preIntro, avaliableTime: $avaliableTime.avaliableTime){
            
            }
            .tabItem {
                Image(systemName: "tray.full")
                Text(NSLocalizedString("Container.All-String", comment: "All tab title"))
            }
            
            //Settings
            SettingPage(period: .constant([]), avaliableTime: $avaliableTime.avaliableTime, selectedSubject: $saveSettings.selectedSubject, preIntro: $preIntro)
                .tabItem {
                    Image(systemName: "gear")
                    Text(NSLocalizedString("Container.Settings-String", comment: "Settings tab title"))
                }
        }
        .onAppear {
            Task {
                do {
                    try await infoss.LoadInfo()
                    
                    self.extractedPageInfos = extractPageInfo(from: infoss.infoData)
                    
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

extension Container {
    func extractPageInfo(from metaPageInfos: [MetaPageInfo]) -> [PageInfo] {
        
        
        
        var allPageInfos: [PageInfo] = []
        for metaPageInfo in metaPageInfos {
            allPageInfos.append(contentsOf: metaPageInfo.pageinfo)
        }
        return allPageInfos
    }
}

struct Container_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
}
