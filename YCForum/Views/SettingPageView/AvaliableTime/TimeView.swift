//
//  TimeView.swift
//  YCForum
//
//  Created by Sonic Liu on 3/11/2023.
//

import SwiftUI

struct TimeView: View {
    @Binding var avaliableTime: String
    
    var body: some View {
        HStack {
            Text(NSLocalizedString("TimeView.WorkHour-String", comment: "Work hour"))
            Spacer()
            Text(avaliableTime)
        }
        .accentColor(.blue)
        .padding()
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(avaliableTime: .constant("1"))
    }
}
