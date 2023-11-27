//
//  SelectionOFSubject.swift
//  YCForum
//
//  Created by Sonic Liu on 18/11/2023.
//

import SwiftUI

struct SelectionOFSubject: View {
    
    @Binding var selectedSubjects: Set<Subject>
    @StateObject var saveSettings = SaveSettings()

    var body: some View {
        NavigationStack {
            
            VStack {
                Text("Set your subject choice!")
                List(Subject.allCases, id: \.self) { subject in
                    HStack {
                        Text(subject.name)
                            .padding(.leading)
                        
                        Spacer()
                        
                        if saveSettings.selectedSubject.contains(subject) {
                            Button("Hide") {
                                saveSettings.selectedSubject.remove(subject)
                                saveSettings.saveSettings()
                            }
                            .padding(.trailing)
                        } else {
                            Button("Select") {
                                saveSettings.selectedSubject.insert(subject)
                                saveSettings.saveSettings()
                            }
                            .padding(.trailing)
                        }
                    }
                }
            }
            
            
            
        }
        .navigationBarTitle(Text("Selected Subjects"), displayMode: .inline)
        .onAppear{
            saveSettings.loadSettings()
        }
        .onDisappear {
            saveSettings.saveSettings() // Save settings when the view disappears
        }
        
    }
    
    
    
}

#Preview {
    SelectionOFSubject(selectedSubjects: .constant([.BM,.Chemistry]))
}
