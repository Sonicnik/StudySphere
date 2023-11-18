//
//  TimeView.swift
//  YCForum
//
//  Created by Sonic Liu on 21/10/2023.
//

import SwiftUI

struct TimeSelectorView: View {
    @Binding var avaliableTime: String
    
    
    var body: some View {
        
        
         NavigationStack {
            VStack {
                Text("Number of hours per day: \(avaliableTime)")
                    .padding()
                
                Picker("Avaliable Time", selection: $avaliableTime){
                        Text("1").tag("1")
                        Text("2").tag("2")
                        Text("3").tag("3")
                        Text("4").tag("4")
                        Text("5").tag("5")
                        Text("6").tag("6")
                }
                .pickerStyle(.wheel)
                Spacer()
            }
            .navigationBarTitle(Text("Selected Hours"), displayMode: .inline)
        }
        
    }
}

struct TimeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        TimeSelectorView(avaliableTime: .constant("1"))
    }
}
