//
//  CalendarPage.swift
//  YCForum
//
//  Created by Sonic Liu on 20/1/2024.
//

import SwiftUI

struct CustomeCalendar: View {
    
    @State var currentDate: Date = Date()
    
    @State var currentMonth: Int = 0
    
    var absoluteDate: Date = Date()
    
    var body: some View {
        
        VStack(spacing: 35){
            
            // Days per week
            let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            //Heading part
            HStack(spacing: 20) {
                
                Button {
                    withAnimation(){
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    
                    Text(extraData()[1])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraData()[0])
                        .font(.title.bold())
                }
                
                Spacer()
                
                Button {
                    withAnimation(){
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
                
                
            }
            .padding(.horizontal)
            
            // Day View
            HStack(spacing: 20) {
                ForEach(days, id: \.self) {dayday in
                    Text(dayday)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            // Dates
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                
                ForEach(extractDate()){value in
                    
                    dateCardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color(.indigo))
                                .padding(.horizontal, 8)
                                .opacity(isSameDay(date1: value.date, date2: absoluteDate) ? 1: 0)
                            
                        )
                }
            }
            
            Spacer()
        }
        .onChange(of: currentMonth){ newValue in
            
            //Update Month
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func dateCardView(value: DateValue)->some View {
        
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
    CustomeCalendar()
}
