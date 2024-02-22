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
    @State private var isPresentingNewEditView = false
    @ObservedObject var saveSettings = SaveSettings()
    @ObservedObject var store =  storePageInfo() // Injected storePageInfo instance

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Task")
                .font(.title2.bold())
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            
            Text(dates, style: .date)
                .font(.callout)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            
            if let index = metaInfo.firstIndex(where: { info in
                isSameDay(date1: info.pageDate, date2: dates)
            }) {
                VStack {
                    dateCardView(metaInfo: $metaInfo[index])
                        .foregroundColor(.black)
                    
                    Spacer()
                    Button(action: {
                        isPresentingNewEditView = true
                    }) {
                        Text("Add New Task")
                    }
                    .sheet(isPresented: $isPresentingNewEditView) {
                        NewSheet(infos: $metaInfo[index].pageinfo, isPresentingNewEditView: $isPresentingNewEditView, selectedSubject: $saveSettings.selectedSubject, currentDate: dates)
                    }
                }
            } else {
                EmptyDate(dates: dates, metaInfo: $metaInfo)
            }
        }
//        .onAppear(perform: {
//                Task {
//                    do {
//                        try await store.LoadInfo()
//                        self.metaInfo = store.infoData
//                    } catch {
//                        print("Failed to load MetaPageInfo: \(error.localizedDescription)")
//                    }
//                }
//
//        })
    }

    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
}

extension datePage {
    func findMetaPageInfoIndex(byDate targetDate: Date, inMetaPageInfos metaPageInfos: [MetaPageInfo]) -> Int? {
        let calendar = Calendar.current
        return metaPageInfos.firstIndex { metaPageInfo in
            let date1 = calendar.startOfDay(for: metaPageInfo.pageDate)
            let date2 = calendar.startOfDay(for: targetDate)
            return date1 == date2
        }
    }
}

// Remember to replace "/* Your Binding Here */" with the actual binding for selectedSubject when you implement NewSheet.


#Preview {
    datePage(metaInfo: .constant(MetaPageInfo.sampleMetaPageInfo), dates: Date())
}
