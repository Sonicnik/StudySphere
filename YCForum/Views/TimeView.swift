//
//  TimeView.swift
//  YCForum
//
//  Created by Sonic Liu on 21/10/2023.
//

import SwiftUI

struct TimeView: View {
    @State var avaliableTime: String = "1"
    
    
    let period: PeriodInfo
    
    var body: some View {
        
        
        HStack {
            Text("Number of hours per day")
            Spacer()
            
            Picker("Avaliable Time",selection: $avaliableTime){
                    Text("1").tag("1")
                    Text("2").tag("2")
                    Text("3").tag("3")
                    Text("4").tag("4")
                    Text("5").tag("5")
                    Text("6").tag("6")
                    Text("7").tag("7")
            }
            .pickerStyle(.wheel)
        }
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(period: PeriodInfo.samplePeriods[0])
    }
}
