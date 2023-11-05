//
//  SettingView.swift
//  YCForum
//
//  Created by Sonic Liu on 21/10/2023.
//

import SwiftUI

struct SettingPage: View {
    @Binding var period: [PeriodInfo]
    @State var avaliableTime: String
    
    var body: some View {
        
        NavigationView {
            List{
                Section(header: Text("Avaliable Time")) {
                    NavigationLink(destination:TimeSelectorView(avaliableTime: $avaliableTime)) {
                        TimeView(avaliableTime: $avaliableTime)
                        
                    }
                }
                                   
                Section(header: Text("Subjects")) {
                        
                }
            }
            .navigationTitle("Setting")
        }
        
    }
                                   
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage(period: .constant(PeriodInfo.samplePeriods), avaliableTime: "1")
    }
}
