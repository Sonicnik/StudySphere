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
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image(systemName: info.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                
                Text(shortenString(info.title))
                    .font(.title2)
                    .fontWeight(.black)
                    .padding(.leading)
                    .accessibilityAddTraits(.isHeader)
                
                Spacer()
                
                Text(info.duedate.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color.secondary)
                
            }
            
            Text(info.subjects.name + " - " + info.formats.rawValue)
                .font(.footnote)
                .fontWeight(.regular)
            
            HStack {
                Text("Est Time: " + calculatedTime(eTime: info.eTime))
                    .font(.caption)
                    .fontWeight(.regular)
                
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [subjectColor(subject: info.subjects).opacity(1), info.theme.accentColor.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0, y: 2)
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
    
    
    
    func subjectColor(subject: Subject) -> Color{
        var color: Theme = .bubblegum
        
        switch subject{
        case .Economics:
            color = .purple
            
        case .BM:
            color = .bubblegum
            
        case .Chemistry:
            color = .periwinkle
            
        case .CS:
            color = .magenta
            
        case .Mathematics:
            color = .seafoam
            
        case .Physics:
            color = .sky
            
        case .Chinese:
            color = .tan
            
        case .English:
            color = .teal
            
        case .VA:
            color = .buttercup
            
        case .DT:
            color = .sky
            
        case .Psychology:
            color = .magenta
            
        case .ESS:
            color = .sky
            
        case .TOK:
            color = .poppy
            
        case .CAS:
            color = .periwinkle
            
        case .EE:
            color = .tan
            
        case .Biology:
            color = .seafoam
        case .noChoice:
            color = .sky
        case .History:
            color = .bubblegum
        case .Geography:
            color = .magenta
        }
        
        return color.mainColor

    }

    
}

struct CardView_Previews: PreviewProvider {
    static var info = PageInfo.sampleData[0]
    static var previews: some View {
        CardView(info: info)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
