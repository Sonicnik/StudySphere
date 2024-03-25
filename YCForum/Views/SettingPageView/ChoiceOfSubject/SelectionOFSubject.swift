//
//  SelectionOFSubject.swift
//  YCForum
//
//  Created by Sonic Liu on 18/11/2023.
//

import SwiftUI

struct SelectionOFSubject: View {
    
    @ObservedObject var saveSettings = SaveSettings()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(NSLocalizedString("SelectionOFSubject.SetSubjectChoice-String", comment: "Set your subject choice"))
                List(Subject.allCases, id: \.self) { subjectIB in
                    HStack {
                        if subjectIB != .noChoice {
                            Text(subjectIB.name)
                                .padding(.leading)
                            
                            Spacer()
                            
                            if saveSettings.selectedSubject.contains(subjectIB) {
                                Button(NSLocalizedString("SelectionOFSubject.Hide-String", comment: "Hide button")) {
                                    saveSettings.selectedSubject.remove(subjectIB)
                                    saveSettings.saveSettings()
                                }
                                .padding(.trailing)
                            } else {
                                Button(NSLocalizedString("SelectionOFSubject.Select-String", comment: "Select button")) {
                                    saveSettings.selectedSubject.insert(subjectIB)
                                    saveSettings.saveSettings()
                                }
                                .padding(.trailing)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(NSLocalizedString("SelectionOFSubject.SelectedSubjects-String", comment: "Selected Subjects")), displayMode: .inline)
        .onAppear {
            saveSettings.loadSettings()
        }
        .onDisappear {
            saveSettings.saveSettings() // Save settings when the view disappears
        }
    }
}

#Preview {
    SelectionOFSubject()
}
