//
//  datecardViewUI.swift
//  YCForum
//
//  Created by Sonic Liu on 14/3/2024.
//

import SwiftUI

struct datecardViewUI: View {
    var day: Date
    var absoluteDate: Date
    var currentDate: Date = Date()
    @Binding var selectedDate: Date
    
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }
    
    private var weekdayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }
    
    var body: some View {
        VStack {
            Text(weekdayFormatter.string(from: day))
                .font(.system(size: 14))
                .foregroundColor(.white)
            Text(dayFormatter.string(from: day))
                .font(.system(size: 16))
                .padding(8)
                .foregroundColor(self.selectedDate == day ? .gray : .white)
                .background(
                    self.isSameDay(date1: day, date2: currentDate) ? Color(.currentDate) : Color.clear
                )
                .cornerRadius(6)
                .opacity(self.isSameDay(date1: day, date2: absoluteDate) ? 1 : 0.6)

        }
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}
#Preview {
    datecardViewUI(day: Date(), absoluteDate: Date(), selectedDate: .constant(Date()))
}
