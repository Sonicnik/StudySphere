//
//  Container.swift
//  YCForum
//
//  Created by Sonic Liu on 21/10/2023.
//

import SwiftUI

struct Container: View {
    @StateObject private var info = storeData()
    
    var body: some View {
        TabView {
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
            .tabItem() {
                Image(systemName: "tray.full")
                Text("Today's")
            }
            
            
            
            
            SettingPage(period: .constant(PeriodInfo.samplePeriods), avaliableTime: "1")
                .tabItem(){
                    Image(systemName: "house")
                    Text("Setting")
                }
        }
    }
}

struct Container_Previews: PreviewProvider {
    static var previews: some View {
        Container()
    }
}
