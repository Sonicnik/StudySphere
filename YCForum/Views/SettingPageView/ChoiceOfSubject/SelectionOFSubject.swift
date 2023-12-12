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
                Text("Set your subject choice!")
                List(Subject.allCases, id: \.self) { subjectIB in
                    
                    HStack {
                        if subjectIB != .noChoice {
                            
                            
                            Text(subjectIB.name)
                                .padding(.leading)
                            
                            Spacer()
                            
                            if saveSettings.selectedSubject.contains(subjectIB) {
                                Button("Hide") {
                                    saveSettings.selectedSubject.remove(subjectIB)
                                    saveSettings.saveSettings()
                                }
                                .padding(.trailing)
                            } else {
                                Button("Select") {
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
    SelectionOFSubject()
}
