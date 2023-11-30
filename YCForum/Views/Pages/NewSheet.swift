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
    
    let notificationMag = NotificationManager.instance
    
    
    var body: some View {
        NavigationStack {
            EditView(info: $newPage, selectedSubject: $selectedSubject)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Post") {
                            if newPage.subjects != .noChoice {
                                infos.append(newPage)
                                isPresentingNewEditView = false
                                notificationMag.scheduleNotification(for: newPage,
                                                                     at: newPage.duedate,
                                                                     subtitle: "\(newPage.subjects) \(newPage.formats)'s due date is just at the corner!!",
                                                                     identifier: newPage.id)
                            } else if newPage.subjects == .noChoice {
                                subjectError = true
                               
                            }
                            
                            
                        }
                        .alert(isPresented: $subjectError){
                            Alert(title: Text("Subject Required"),
                                  dismissButton: .default(Text("OK")))
                        }
                    }
                }
                .navigationTitle("Add More Work 😤")
        }
        
    }
}

struct NewSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewSheet(infos: .constant(PageInfo.sampleData), isPresentingNewEditView: .constant(true), selectedSubject: .constant([.BM, .Chemistry]))
    }
}
