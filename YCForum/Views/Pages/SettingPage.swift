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
    let feedBackURL = URL(string: "https://forms.office.com/r/K1mGqhGQN8")!
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(NSLocalizedString("Setting.secBasic-String", comment: "Basic settings section header"))) {
                    NavigationLink(destination: TimeSelectorView(avaliableTime: $avaliableTime)) {
                        TimeView(avaliableTime: $avaliableTime)
                    }
                    
                    NavigationLink(destination: SelectionOFSubject()){
                        SetSubject(selectedSubjects: $selectedSubject)
                    }
                }
                
                Section(header: Text(NSLocalizedString("Setting.secInfo-String", comment: "Info section header"))) {
                    NavigationLink(destination: BioPage()) {
                        BioView()
                    }
                    
                    Button(NSLocalizedString("Setting.introPage-String", comment: "Intro page button")) {
                        preIntro = true
                    }
                    .padding()
                    
                    Link(NSLocalizedString("Setting.feedback-String", comment: "Feedback link"), destination: feedBackURL)
                        .font(.headline)
                        .padding()
                }
                
            }
            .navigationTitle(Text(NSLocalizedString("Setting.title-String", comment: "Settings page title")))
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage(period: .constant(PeriodInfo.samplePeriods), avaliableTime: .constant("1"), selectedSubject: .constant([.BM, .Chemistry, .Chinese, .Economics, .Mathematics, .Physics]), preIntro: .constant(false))
    }
}
