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
    let targetDate = Date()
    var indexs = 0
    
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
                
//                if let metaInfo = metaInfo.first(where: { info in
//                    return isSameDay(date1: info.pageDate, date2: dates)
//                }) {
//                    dateCardView(metaInfo: metaInfo)
//                        .foregroundColor(.black)
//                } else {
//                    Text("no task found")
//                }
                
                if metaInfo.first(where: { info in
                    return isSameDay(date1: info.pageDate, date2: dates)
                }) != nil {
                    dateCardView(metaInfo: $metaInfo[indexs])
                        .foregroundColor(.black)
                }  else {
                    Text("no task found")
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .onAppear(perform: {
                
            })
            
            
        //}
        
        
    }
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

extension datePage{
    func findMetaPageInfoIndex(byDate targetDate: Date, inMetaPageInfos metaPageInfos: [MetaPageInfo]) -> Int? {
        let calendar = Calendar.current
        return metaPageInfos.firstIndex { metaPageInfo in
            // Compare just the date components (year, month, day) of the pageDate and targetDate
            let date1 = calendar.startOfDay(for: metaPageInfo.pageDate)
            let date2 = calendar.startOfDay(for: targetDate)
            return date1 == date2
        }
    }
}

#Preview {
    datePage(metaInfo: .constant(MetaPageInfo.sampleMetaPageInfo), dates: Date())
}
