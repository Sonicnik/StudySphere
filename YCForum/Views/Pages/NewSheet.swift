//
//  NewSheet.swift
//  YCForum
//
//  Created by Sonic Liu on 9/7/2023.
//

import SwiftUI

struct NewSheet: View {
    @State private var newPage = PageInfo.emptyPage
    
    @Binding var infos: [PageInfo]
    
    @Binding var isPresentingNewEditView : Bool
    
    @Binding var avaliableSubject: Set<Subject>
    
    let notificationMag = NotificationManager.instance
    
    
    var body: some View {
        NavigationStack {
            EditView(info: $newPage, avaliableSubject: $avaliableSubject)
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
                                // Show an alert if subject isn't chosen
                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                    let alertController = UIAlertController(title: "Subject Required", message: "Please select a subject before posting.", preferredStyle: .alert)
                                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
                                    
                                    windowScene.windows.first?.rootViewController?.present(alertController, animated: true, completion: nil)
                                }
                            }
                            
                            
                        }
                    }
                }
                .navigationTitle("Add More Work 😤")
        }
        
    }
}

struct NewSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewSheet(infos: .constant(PageInfo.sampleData), isPresentingNewEditView: .constant(true), avaliableSubject: .constant([.BM, .Chemistry]))
    }
}
