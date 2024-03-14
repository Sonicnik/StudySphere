//
//  MiniCalendar.swift
//  YCForum
//
//  Created by Sonic Liu on 13/3/2024.
//

import SwiftUI

struct MiniCalendar: View {
    
    @Binding var info: [MetaPageInfo]
    
    @State var currentMonth: Int = 0
    
    @State var currentDate: Date = Date()
    
    @State private var isExpendingCalendar: Bool = false
    
    var absoluteDate: Date = Date()
    
    @Environment(\.colorScheme) var colorScheme
    
    private var daysInCurrentWeek: [Date] {
        guard let weekRange = Calendar.current.range(of: .day, in: .weekOfMonth, for: Date()) else { return [] }
        let startOfWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
        return (weekRange.lowerBound..<weekRange.upperBound).compactMap { Calendar.current.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
    
    var body: some View {
        VStack {
            
            let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack {
                Text(extraData()[0])
                    .font(.title2).bold()
                    
                Spacer()
                Button {
                    isExpendingCalendar = true
                } label: {
                    Image(systemName: "arrow.up.left.and.arrow.down.right")
                        .font(.system(size: 20))
                        .frame(width: 30, height: 30, alignment: .trailing)
                        .bold()
                }
                
            }
            .padding()
            
            HStack(spacing: 20) {
                ForEach(days, id: \.self) {dayday in
                    Text(dayday)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal)
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 15) {
                
                ForEach(extractDate()){value in
                    NavigationLink(destination: datePage(metaInfo: $info, dates: value.date)){
                        dateCardView(value: value)
                            .background(
                                Capsule()
                                    .fill(Color(.indigo))
                                    .padding(.horizontal, 8)
                                    .opacity(isSameDay(date1: value.date, date2: absoluteDate) ? 1: 0)
                                
                            )
                    }
                    
                    
                }
            }
            .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: .move(edge: .leading).combined(with: .opacity)))
            .animation(.easeInOut(duration: 0.5), value: currentMonth)

        }
        
    }
    
    @ViewBuilder
    func dateCardView(value: DateValue)->some View {
        
        VStack{
            
            if value.day != -1 {
                if let task = info.first(where: { task in
                    
                    return isSameDay(date1: task.pageDate, date2: value.date)
                }) {
                    Text("\(value.day)")
                        .font(.callout.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: absoluteDate) ? .white : (colorScheme == .dark ? .white : .black))
                        .frame(maxWidth: .infinity)

                    
                    Spacer()
                    //Add matching colors to the circle of the day and subjects
                    Circle()
                        .fill(isSameDay(date1: task.pageDate, date2: currentDate) ? .white : Color(.sky))
                        .frame(width: 8, height: 8)
                        
                }
                else{
                    
                    Text("\(value.day)")
                        .font(.callout.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: absoluteDate) ? .white : (colorScheme == .dark ? .white : .black))
                        .frame(maxWidth: .infinity)
                    
                    
                }
            }
        }
        .padding(.vertical, 8)
        .frame(height: 60, alignment: .top)
    }
     
    
    
}

#Preview {
    MiniCalendar(info: .constant(MetaPageInfo.sampleMetaPageInfo))
}
