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
            Text("Avaliable Time")
            Spacer()
            Text(avaliableTime)
            Image(systemName: "chevron.right")
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