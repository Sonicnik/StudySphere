//
//  timeSelectionPicker.swift
//  YCForum
//
//  Created by Sonic Liu on 5/11/2023.
//

import SwiftUI

struct timeSelectionPicker: View {
    @State private var eTimeH = 0
    @State private var eTimeM = 30
    
    @Binding var eTime: Int
    
    var body: some View {
        HStack {
            Picker(NSLocalizedString("timeSelectionPicker.EstimatedTime-String", comment: "Estimated Time"), selection: $eTimeH){
                ForEach(0..<24) { indexs in
                    Text("\(indexs)").tag(indexs)
                }
            }
            .pickerStyle(.wheel)
            
            Text(NSLocalizedString("timeSelectionPicker.Hours-String", comment: "Hours"))
            
            Picker("", selection: $eTimeM) {
                ForEach(Array(stride(from: 0, to: 60, by: 5)), id: \.self) { index in
                    Text("\(index)").tag(index)
                }
            }
            .pickerStyle(.wheel)

            
            Text(NSLocalizedString("timeSelectionPicker.Minutes-String", comment: "Minutes"))
            
            
        }
        .padding()
        .onReceive([eTimeH, eTimeM].publisher) { _ in
                        eTime = totalTime(hours: eTimeH, minutes: eTimeM)
            
        }
        
    }
    


}

extension timeSelectionPicker {
    func totalTime(hours eTimeH: Int, minutes eTimeM: Int) -> Int {
        let totalTime = eTimeH*60 + eTimeM
        return totalTime
    }
}

struct timeSelectionPicker_Previews: PreviewProvider {
    static var previews: some View {
        timeSelectionPicker(eTime: .constant(1))
    }
}
