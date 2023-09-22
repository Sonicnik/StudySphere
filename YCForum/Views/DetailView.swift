//
//  DetailView.swift
//  
//
//  Created by Sonic Liu on 5/7/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var info: PageInfo
    
    @State private var editingInfo = PageInfo.emptyPage
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            
            Section(header: Text("Section")) {
                HStack {
                    Label("Type of Work:", systemImage: "square.dashed.inset.filled")
                    Spacer()
                    Text(info.format.name)
                        .padding(.trailing)
                    
                }
                .padding()
                .accessibilityElement(children: .combine)
                
                
                HStack {
                    Label("Subject:", systemImage: "slider.horizontal.below.square.filled.and.square")
                    Spacer()
                    Text(info.subject.name)
                        .padding(.trailing)
                }
                .padding()
                .accessibilityElement(children: .combine)
            }
                
            Section(header: Text("Time & Date")) {
                HStack {
                    Label("Due Date:", systemImage: "calendar.badge.exclamationmark")
                    Spacer()
                    Text(info.duedate.formatted(date: .abbreviated, time: .omitted))
                        .padding(.trailing)
                }
                .padding()
                
                HStack {
                    Label("Due Time:", systemImage: "clock.badge.exclamationmark")
                    Spacer()
                    Text(info.duedate.formatted(date: .omitted, time: .shortened))
                        .padding(.trailing)
                }
                .padding()
            }
            
            Section(header: Text("Description")) {
                
                VStack {
                    
                    HStack {
                        Label("Explanantion", systemImage: "rectangle.and.pencil.and.ellipsis")
                        Spacer()
                    }
                    HStack {
                        Text(info.detail)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .padding()
                    }
                }
                .padding()
            }
        }
        //pass the subject name on using .name variable
        .navigationTitle(info.subject.name)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingInfo = info
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                EditPage(info: $editingInfo)
                    .navigationTitle(info.subject.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                info = editingInfo
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(info: .constant(PageInfo.sampleData[0]))
        }
    }
}
