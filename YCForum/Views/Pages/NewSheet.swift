//
//  NewSheet.swift
//  YCForum
//
//  Created by Sonic Liu on 9/7/2023.
//

import SwiftUI

struct NewSheet: View {
    @State private var newPage = PageInfo.emptyPage
    
    @State var subjectError: Bool = false
    
    @Binding var infos: [PageInfo]
    
    @Binding var isPresentingNewEditView : Bool
    
    @Binding var selectedSubject: Set<Subject>
    
    var currentDate: Date
    
    let notificationMag = NotificationManager.instance
    
    
    var body: some View {
        NavigationStack {
            EditView(info: $newPage, selectedSubject: $selectedSubject)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Newsheet.Dismiss-String") {
                            isPresentingNewEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Newsheet.Post-String") {
                            if newPage.subjects != .noChoice {
                                infos.append(newPage)
                                isPresentingNewEditView = false
                                notificationMag.scheduleNotification(for: newPage,
                                                                     at: newPage.duedate,
                                                                     subtitle: "\(newPage.subjects) \(newPage.formats) Newsheet.DueTmrNotification-string",
                                                                     identifier: newPage.id + "tmr", timeInterval: 1)
                                notificationMag.scheduleNotification(for: newPage, at: newPage.duedate,
                                                                     subtitle: "\(newPage.subjects) \(newPage.formats) Newsheet.DueNowNotification-string",
                                                                     identifier: newPage.id + "td", timeInterval: 0)
                            } else if newPage.subjects == .noChoice {
                                subjectError = true
                               
                            }
                            
                            
                        }
                        .alert(isPresented: $subjectError){
                            Alert(title: Text("Newsheet.SubjectReq-String"),
                                  dismissButton: .default(Text("OK")))
                        }
                    }
                }
                .onAppear(perform: {
                    newPage.duedate = currentDate
                })
                .navigationTitle("Newsheet.AddWork-String")
        }
        
    }
}

struct NewSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewSheet(infos: .constant(PageInfo.sampleData), isPresentingNewEditView: .constant(true), selectedSubject: .constant([.BM, .Chemistry]), currentDate: Date())
    }
}
