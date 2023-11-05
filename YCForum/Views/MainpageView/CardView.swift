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
                Image(systemName: info.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.title)
                
                Text(info.subject.name + " - " + info.format.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading)
                    .accessibilityAddTraits(.isHeader)
                Spacer()
                
                Text(info.duedate.formatted(date: .abbreviated, time: .omitted))
                    .font(.headline)
                    .padding(.horizontal)
                
            }
            .padding(.bottom)
            
                        
            
            Text(info.detail)
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .padding([.leading, .bottom, .trailing])
                        
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
