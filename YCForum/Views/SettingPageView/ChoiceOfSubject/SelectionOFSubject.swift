//
//  SelectionOFSubject.swift
//  YCForum
//
//  Created by Sonic Liu on 18/11/2023.
//

import SwiftUI

struct SelectionOFSubject: View {
    @State private var selectedSubjects: Set<Subject> = []
    
    var body: some View {
        NavigationStack {
            Section(header: Text("Selections")) {
                    List(Subject.allCases, id: \.self) { subject in
                        HStack {
                            Text(subject.name)
                                .padding(.leading)
                            
                            Spacer()
                            
                            if selectedSubjects.contains(subject) {
                                Button("Hide") {
                                    selectedSubjects.remove(subject)
                                }
                                .padding(.trailing)
                            } else {
                                Button("Select") {
                                    selectedSubjects.insert(subject)
                                }
                                .padding(.trailing)
                            }
                        }
                    }
                
            }
            .navigationBarTitle(Text("Selected Subjects"), displayMode: .inline)
        }
        
    }
}

#Preview {
    SelectionOFSubject()
}
