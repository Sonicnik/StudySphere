//
//  timeSelectionPicker.swift
//  YCForum
//
//  Created by Sonic Liu on 5/11/2023.
//

import SwiftUI

struct timeSelectionPicker: View {
    @State private var eTimeH = 1
    @State private var eTimeM = 30
    
    @Binding var eTime: Int
    
    var body: some View {
        HStack {
            Picker("Estimated Time", selection: $eTimeH){
                ForEach(0..<3) { indexs in
                    Text("\(indexs)").tag(indexs)
                }
            }
            .pickerStyle(.wheel)
            
            Text("Hours")
            
            Picker("", selection: $eTimeM){
                ForEach(0..<60) { indexs in
                    Text("\(indexs)").tag(indexs)
                }
            }
            .pickerStyle(.wheel)
            
            Text("Minutes")
            
            
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
