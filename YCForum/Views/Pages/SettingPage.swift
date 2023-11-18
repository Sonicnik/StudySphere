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
    @Binding var selectedSubject: Set<Subject>
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basics")) {
                    NavigationLink(destination: TimeSelectorView(avaliableTime: $avaliableTime)) {
                        TimeView(avaliableTime: $avaliableTime)
                    }
                    
                    NavigationLink(destination: SelectionOFSubject(selectedSubjects: $selectedSubject)){
                        SetSubject(selectedSubjects: $selectedSubject)
                    }
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage(period: .constant(PeriodInfo.samplePeriods), avaliableTime: "1", selectedSubject: .constant([.Business, .Chemistry, .Chinese, .Economics, .MATH, .Physics]))
    }
}
