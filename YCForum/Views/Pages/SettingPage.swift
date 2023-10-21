//
//  SettingView.swift
//  YCForum
//
//  Created by Sonic Liu on 21/10/2023.
//

import SwiftUI

struct SettingPage: View {
    @Binding var period: [PeriodInfo]
    
    var body: some View {
        Text("This is the setting view")
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage(period: .constant(PeriodInfo.samplePeriods))
    }
}
