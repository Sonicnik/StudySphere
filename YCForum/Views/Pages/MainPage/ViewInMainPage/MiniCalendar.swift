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
    
    private var daysInWeek: [Date] {
        let calendar = Calendar.current
        let startOfWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
    
    var body: some View {
        VStack {
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
            
            HStack(spacing: 15) {
                ForEach(daysInWeek, id: \.self) { day in
                    datecardViewUI(day: day, absoluteDate: absoluteDate, selectedDate: $currentDate)
                        
                }
            }
            .padding(.horizontal, 10)
        }
        .onAppear {
            self.currentDate = Date()
        }
        
    }
    
     
    
    
}

#Preview {
    MiniCalendar(info: .constant(MetaPageInfo.sampleMetaPageInfo))
}
