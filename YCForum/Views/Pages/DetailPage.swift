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
    
    @Binding var selectedSubject: Set<Subject>
    
    var body: some View {
        List {
            Section(header: Text("🦾")) {
                
                    HStack {
                        Button (action: {
                            info.isDone.toggle()
                            notificationMag.updateDueDate(for: editingInfo,
                                                          newDueDate: editingInfo.duedate,
                                                          subtitle: "Your \(editingInfo.subjects)'s \(editingInfo.formats) is marked done and due tomorrow, double check if you finished the work.",
                                                          identifier: editingInfo.id + "tmr", timeInterval: 1)
                            notificationMag.updateDueDate(for: editingInfo, newDueDate: editingInfo.duedate, subtitle: "Did you finish your work? \(editingInfo.title) \(editingInfo.subjects) is due.", identifier: editingInfo.id + "td", timeInterval: 0)
                        }) {
                            Label("DetailPage.CheckForStats-String", systemImage: info.isDone ? "checkmark.circle.fill" : "circle")
                        }
                        
                        Spacer()
                        Text(info.isDone ? "DetailPage.WorkFinished-String": "DetailPage.WorkUnfinished-String")
                            .padding(.trailing)
                        
                    }
                    .padding()
                    
                    HStack {
                        Label("Work is", systemImage: "chart.bar.doc.horizontal.fill")
                        
                        
                        Spacer()
                        Text(info.isHidden ? "DetailPage.WorkUndue-string": "DetailPage.WorkDue-string")
                            .padding(.trailing)
                    }
                    .padding()
                    
                
            }
            
            
            Section(header: Text("Section")) {
                HStack {
                    Label("Type", systemImage: "square.dashed.inset.filled")
                    Spacer()
                    Text(info.formats.localizedName)
                        .padding(.trailing)
                    
                }
                .padding()
                .accessibilityElement(children: .combine)
                
                
                HStack {
                    Label("Subject", systemImage: "slider.horizontal.below.square.filled.and.square")
                    Spacer()
                    Text(info.subjects.name)
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
            
            Section(header: Text("Details")) {
                
                VStack {
                    
                    HStack {
                        Label("Notes", systemImage: "rectangle.and.pencil.and.ellipsis")
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
        .navigationTitle(info.subjects.name + "-" + info.formats.localizedName)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingInfo = info
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                EditView(info: $editingInfo, selectedSubject: $selectedSubject)
                    .navigationTitle(info.subjects.name)
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
                                                              subtitle: "Your \(editingInfo.subjects)'s \(editingInfo.formats) is due tomorrow!!",
                                                              identifier: editingInfo.id, timeInterval: 1)
                                notificationMag.updateDueDate(for: editingInfo, newDueDate: editingInfo.duedate, subtitle: "Did you finish your work? \(editingInfo.title) \(editingInfo.subjects) is due.", identifier: editingInfo.id + "td", timeInterval: 0)
                                
                            }
                        }
                    }
            }
        }
    }
}

extension DetailPage {
    func shortenString(_ input: String) -> String {
        if input.count > 10 {
            let shortenedString = String(input.prefix(10)) + "..."
            
            return shortenedString
        } else {
            return input
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailPage(info: .constant(PageInfo.sampleData[0]), selectedSubject: .constant([.BM, .Chinese, .Economics]))
        }
    }
}
