//
//  dateCardView.swift
//  YCForum
//
//  Created by Sonic Liu on 21/1/2024.
//

import SwiftUI

struct dateCardView: View {
    
    var value: DateValue
    
    var body: some View {
        VStack{
            
            if value.day != -1 {
                if let task = sampleMetaPageInfo.first(where: { task in
                    
                    return isSameDay(date1: task.pageDate, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.callout.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: absoluteDate) ? .white: .black)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                    //Add matching colors to the circle of the day and subjects
                    Circle()
                        .fill(isSameDay(date1: task.pageDate, date2: currentDate) ? .white : Color(.indigo))
                        .frame(width: 8, height: 8)
                        
                }
                else{
                    
                    Text("\(value.day)")
                        .font(.callout.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: absoluteDate) ? .white: .black)
                        .frame(maxWidth: .infinity)
                        .onAppear(perform: {
                            print(absoluteDate)
                        })
                    
                    Spacer()
                }
            }
        }
        .padding(.vertical, 8)
        .frame(height: 60, alignment: .top)
    
    }
}





#Preview {
    dateCardView(value: DateValue(id: "1C0C2F4B-624C-479B-B457-1B25630014D3", day: 4, date: Date()))
}
