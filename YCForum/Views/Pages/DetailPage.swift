//
//  DetailView.swift
//  
//
//  Created by Sonic Liu on 5/7/2023.
//

import SwiftUI

struct DetailPage: View {
    @Binding var info: PageInfo
    
    @State private var editingInfo = PageInfo.emptyPage
    
    let notificationMag = NotificationManager.instance
    
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("🦾")) {
                
                    HStack {
                        Button (action: {
                            info.isDone.toggle()
                            notificationMag.updateDueDate(for: editingInfo,
                                                          newDueDate: editingInfo.duedate,
                                                          subtitle: "Your \(editingInfo.subject)'s \(editingInfo.format) is marked done and due tomorrow, double check if you finished the work.",
                                                          identifier: editingInfo.id)
                        }) {
                            Label("Done?", systemImage: info.isDone ? "checkmark.circle.fill" : "circle")
                        }
                        
                        Spacer()
                        Text(info.isDone ? "Lets Go!!😎": "Almost there! 🤯")
                            .padding(.trailing)
                        
                    }
                    .padding()
                    
                    HStack {
                        Label("Work is for", systemImage: info.isHidden ? "checkmark.circle.fill" : "circle")
                        
                        
                        Spacer()
                        Text(info.isDone ? "Lets Go!!😎": "Almost there! 🤯")
                            .padding(.trailing)
                    }
                    .padding()
                    
                
            }
            
            
            Section(header: Text("Section")) {
                HStack {
                    Label("Type", systemImage: "square.dashed.inset.filled")
                    Spacer()
                    Text(info.format.name)
                        .padding(.trailing)
                    
                }
                .padding()
                .accessibilityElement(children: .combine)
                
                
                HStack {
                    Label("Subject", systemImage: "slider.horizontal.below.square.filled.and.square")
                    Spacer()
                    Text(info.subject.name)
                        .padding(.trailing)
                }
                .padding()
                .accessibilityElement(children: .combine)
            }
                
            Section(header: Text("Time & Date")) {
                HStack {
                    Label("Due Date", systemImage: "calendar.badge.exclamationmark")
                    Spacer()
                    Text(info.duedate.formatted(date: .abbreviated, time: .omitted))
                        .padding(.trailing)
                }
                .padding()
                
                HStack {
                    Label("Due Time", systemImage: "clock.badge.exclamationmark")
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
                        Spacer()
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
                EditView(info: $editingInfo)
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
                                notificationMag.updateDueDate(for: editingInfo,
                                                              newDueDate: editingInfo.duedate,
                                                              subtitle: "Your \(editingInfo.subject)'s \(editingInfo.format) is due tomorrow!!",
                                                              identifier: editingInfo.id)
                                
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
            DetailPage(info: .constant(PageInfo.sampleData[0]))
        }
    }
}
