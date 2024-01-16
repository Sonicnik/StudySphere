//
//  CalendarPage.swift
//  YCForum
//
//  Created by Sonic Liu on 16/1/2024.
//

import SwiftUI


// CalendarView - main view for displaying the calendar
struct CalendarPage: View {
    @State private var currentDate = Date()

    var body: some View {
        VStack {
            // Display the month and year
            Text(currentDate.monthYearText)
                .font(.title)
                .padding()

            // Weekday headers
            WeekdayHeader()

            // Dates grid
            DatesGrid(currentDate: $currentDate)

            // Month navigation buttons
            HStack {
                Button(action: { self.currentDate = self.currentDate.previousMonth }) {
                    Text("Previous")
                }

                Button(action: { self.currentDate = self.currentDate.nextMonth }) {
                    Text("Next")
                }
            }
            .padding()
        }
    }
}

// WeekdayHeader - view to display weekday names
struct WeekdayHeader: View {
    private let weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]

    var body: some View {
        HStack {
            ForEach(weekdays, id: \.self) { day in
                Text(day)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

// DatesGrid - view to display the days of the month in a grid
struct DatesGrid: View {
    @Binding var currentDate: Date

    var body: some View {
        let days = generateDaysInMonth(for: currentDate)

        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
            ForEach(days, id: \.self) { day in
                Text(String(Calendar.current.component(.day, from: day)))
                    .frame(width: 30, height: 30)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(15)
            }
        }
    }

    // Generate an array of dates representing the days of the current month
    private func generateDaysInMonth(for date: Date) -> [Date] {
        var days = [Date]()

        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!

        var day = calendar.startOfMonth(for: date)
        for _ in 1...range.count {
            days.append(day)
            day = calendar.date(byAdding: .day, value: 1, to: day)!
        }

        return days
    }
}

// Date Extension - helper methods for date manipulation
extension Date {
    var monthYearText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: self)
    }

    var previousMonth: Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)!
    }

    var nextMonth: Date {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)!
    }
}

// Calendar Extension - helper method to get the start of the month
extension Calendar {
    func startOfMonth(for date: Date) -> Date {
        let components = dateComponents([.year, .month], from: date)
        return self.date(from: components)!
    }
}

// Preview
#Preview {
    CalendarPage()
}
