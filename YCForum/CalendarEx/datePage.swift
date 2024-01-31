//
//  datePage.swift
//  YCForum
//
//  Created by Sonic Liu on 21/1/2024.
//

import SwiftUI

struct datePage: View {
    
    @Binding var metaInfo: [MetaPageInfo]
    let dates: Date
    
    var body: some View {
        
 //       NavigationView {
            VStack(alignment: .leading, spacing: 5) {
                Text("Task")
                    .font(.title2.bold())
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    
                
                Text(dates, style: .date)
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                if let metaInfo = metaInfo.first(where: { task in
                    return isSameDay(date1: task.pageDate, date2: dates)
                }) {
                    dateCardView(metaInfo: metaInfo)
                        .foregroundColor(.black)
                } else {
                    Text("no task found")
                }
                
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            
        //}
        
        
    }
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

#Preview {
    datePage(metaInfo: .constant([sampleMetaPageInfo[0], sampleMetaPageInfo[1], sampleMetaPageInfo[2]]), dates: Date())
}
