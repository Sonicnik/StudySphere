//
//  CardView.swift
//  
//
//  Created by Sonic Liu on 4/7/2023.
//

import SwiftUI

struct CardView: View {
    
    let info: PageInfo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(info.subject.name)
                    .font(.headline)
                    .fontWeight(.bold)
                .accessibilityAddTraits(.isHeader)
                Spacer()
                Text(info.format.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
            .padding()
            
            Text(info.duedate.formatted(date: .abbreviated, time: .shortened))
                .padding()
            
            HStack {
                Spacer()
                Text(info.detail)
                    .font(.body)
                Spacer()
            }
            
        }
        .padding()
        .foregroundColor(info.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var info = PageInfo.sampleData[0]
    static var previews: some View {
        CardView(info: info)
            .background(info.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
