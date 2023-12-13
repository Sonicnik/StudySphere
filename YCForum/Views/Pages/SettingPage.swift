//
//  SettingView.swift
//  YCForum
//
//  Created by Sonic Liu on 21/10/2023.
//

import SwiftUI

struct SettingPage: View {
    @Binding var period: [PeriodInfo]
    @Binding var avaliableTime: String
    @Binding var selectedSubject: Set<Subject>
    @Binding var preIntro: Bool
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basics")) {
                    NavigationLink(destination: TimeSelectorView(avaliableTime: $avaliableTime)) {
                        TimeView(avaliableTime: $avaliableTime)
                    }
                    
                    NavigationLink(destination: SelectionOFSubject()){
                        SetSubject(selectedSubjects: $selectedSubject)
                    }
                }
                
                Section(header: Text("INFO")) {
                    NavigationLink(destination: BioPage()) {
                        BioView()
                    }
                    
                    Button("Introduction Page") {
                        preIntro = true
                    }
                    .padding()
                }
                
            }
            .navigationTitle(Text("Settings"))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage(period: .constant(PeriodInfo.samplePeriods), avaliableTime: .constant("1"), selectedSubject: .constant([.BM, .Chemistry, .Chinese, .Economics, .Mathematics, .Physics]), preIntro: .constant(false))
    }
}
