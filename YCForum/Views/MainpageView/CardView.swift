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
                    .font(.title2)
                
                Text(shortenString(info.title))
                    .font(.title2)
                    .fontWeight(.black)
                    .padding(.leading)
                    .accessibilityAddTraits(.isHeader)
                
                
                
            }
            .padding(.top)
            
            //+ " - " + info.subjects.name
            Text(info.subjects.name + " - " + info.formats.name)
                .font(.callout)
                .fontWeight(.medium)
                .accessibilityAddTraits(.isHeader)
                .padding()
            
            HStack {
                Text("Est Time: " + calculatedTime(eTime: info.eTime))
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                Text(info.duedate.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption2)
                    .padding(.horizontal)
                }
            .padding([.leading, .bottom, .trailing])

                        
        }
        .padding()
        .foregroundColor(info.isHidden ? Color(.gray) : info.theme.accentColor)
    }
}

extension CardView {
    func calculatedTime(eTime time: Int)-> String{
        let min = time%60
        let hour = (time-min)/60
        
        let min2 = String(min)
        let hour2 = String(hour)
        
        let texts = "\(hour2) h \(min2) min"
        return texts
        
    }
    
    func shortenString(_ input: String) -> String {
        if input.count > 10 {
            let shortenedString = String(input.prefix(10)) + "..."
            return shortenedString
        } else {
            return input
        }
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
