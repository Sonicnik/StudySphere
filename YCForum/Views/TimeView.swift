//
//  TimeView.swift
//  YCForum
//
//  Created by Sonic Liu on 21/10/2023.
//

import SwiftUI

struct TimeView: View {
    let period: PeriodInfo
    
    var body: some View {
        HStack{
            Text("A")
            Spacer()
            VStack {
                Text("\(period.startTime)")
                
                Text("To \(period.endTime)")
            }
            .padding()
        }
        .padding()
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(period: PeriodInfo.samplePeriods[0])
    }
}
