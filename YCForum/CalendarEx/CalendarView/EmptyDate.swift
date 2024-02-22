//
//  EmptyDate.swift
//  YCForum
//
//  Created by Sonic Liu on 20/2/2024.
//

import SwiftUI

struct EmptyDate: View {
    var dates: Date
    @Binding var metaInfo: [MetaPageInfo]
    @State private var isPresentingNewEditView = false
    @ObservedObject var saveSettings = SaveSettings()
    
    var body: some View {
        NavigationView{
            
            VStack {
                Text("No task found")
                Spacer()
                Button(action: {
                    metaInfo.append(
                    MetaPageInfo(pageinfo: [], pageDate: dates)
                    )
                    isPresentingNewEditView = true
                }) {
                    Text("Add New Task")
                }
                .sheet(isPresented: $isPresentingNewEditView) {
                    // Assuming NewSheet is a view that is presented as a sheet
                    // You might need to adjust this part based on how NewSheet is structured
                    NewSheet(infos:$metaInfo[metaInfo.count - 1].pageinfo, isPresentingNewEditView: $isPresentingNewEditView, selectedSubject: $saveSettings.selectedSubject, currentDate: Date())
                }

            }
            
            
        }
        
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

#Preview {
    EmptyDate(dates: Date(), metaInfo: .constant(MetaPageInfo.sampleMetaPageInfo))
}
