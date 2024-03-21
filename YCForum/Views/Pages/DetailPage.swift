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
                                                          subtitle: NSLocalizedString("Your %@'s %@ is marked done and due tomorrow, double check if you finished the work.", comment: "Notification subtitle"),
                                                          identifier: editingInfo.id + "tmr", timeInterval: 1)
                            notificationMag.updateDueDate(for: editingInfo, newDueDate: editingInfo.duedate, subtitle: NSLocalizedString("Did you finish your work? %@ %@ is due.", comment: "Notification subtitle"), identifier: editingInfo.id + "td", timeInterval: 0)
                        }) {
                            Label(NSLocalizedString("DetailPage.CheckForStats-String", comment: "Check for stats label"), systemImage: info.isDone ? "checkmark.circle.fill" : "circle")
                        }
                        
                        Spacer()
                        Text(info.isDone ? NSLocalizedString("DetailPage.WorkFinished-String", comment: "Work finished text") : NSLocalizedString("DetailPage.WorkUnfinished-String", comment: "Work unfinished text"))
                                                    .padding(.trailing)
                        
                    }
                    .padding()
                    
                    HStack {
                        Label(NSLocalizedString("Work is", comment: "Work is label"), systemImage: "chart.bar.doc.horizontal.fill")
                        
                        
                        Spacer()
                        Text(info.isHidden ? NSLocalizedString("DetailPage.WorkUndue-String", comment: "Work undue text") : NSLocalizedString("DetailPage.WorkDue-String", comment: "Work due text"))
                            .padding(.trailing)
                    }
                    .padding()
                    
                
            }
            
            
            Section(header: Text(NSLocalizedString("Section", comment: "Section header"))) {
                            HStack {
                                Label(NSLocalizedString("Type", comment: "Type label"), systemImage: "square.dashed.inset.filled")
                                Spacer()
                                Text(NSLocalizedString(info.formats.rawValue, comment: "Format name"))
                                    .padding(.trailing)
                    
                }
                .padding()
                
                
                HStack {
                                Label(NSLocalizedString("Subject", comment: "Subject label"), systemImage: "slider.horizontal.below.square.filled.and.square")
                                Spacer()
                                Text(NSLocalizedString("Subjects.\(info.subjects.rawValue)", comment: "Subject name"))
                                            .padding(.trailing)
                }
                .padding()
            }
                
            Section(header: Text(NSLocalizedString("Time & Date", comment: "Time and date header"))) {
                            HStack {
                                Label(NSLocalizedString("Due Date", comment: "Due date label"), systemImage: "calendar.badge.exclamationmark")
                                Spacer()
                                Text(info.duedate.formatted(date: .abbreviated, time: .omitted))
                                    .padding(.trailing)
                }
                .padding()
                
                HStack {
                                    Label(NSLocalizedString("Due Time", comment: "Due time label"), systemImage: "clock.badge.exclamationmark")
                                    Spacer()
                                    Text(info.duedate.formatted(date: .omitted, time: .shortened))
                                        .padding(.trailing)
                }
                .padding()
            }
            
            Section(header: Text(NSLocalizedString("Details", comment: "Details header"))) {
                
                VStack {
                    
                    HStack {
                                            Label(NSLocalizedString("Notes", comment: "Notes label"), systemImage: "rectangle.and.pencil.and.ellipsis")
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
        navigationTitle(NSLocalizedString("Subjects.\(info.subjects.rawValue)", comment: "Subject name") + "-" + NSLocalizedString(info.formats.rawValue, comment: "Format name"))
                .toolbar {
                    Button(NSLocalizedString("Edit", comment: "Edit button")) {
                        isPresentingEditView = true
                        editingInfo = info
            }
        }
                .sheet(isPresented: $isPresentingEditView) {
                            NavigationStack {
                                EditView(info: $editingInfo, selectedSubject: $selectedSubject)
                                    .navigationTitle(NSLocalizedString("Subjects.\(info.subjects.rawValue)", comment: "Subject name"))
                                    .toolbar {
                                        ToolbarItem(placement: .cancellationAction) {
                                            Button(NSLocalizedString("Cancel", comment: "Cancel button")) {
                                isPresentingEditView = false
                            }
                        }
                                        ToolbarItem(placement: .confirmationAction) {
                                                                    Button(NSLocalizedString("Done", comment: "Done button")) {
                                                                        isPresentingEditView = false
                                                                        info = editingInfo
                                                                        notificationMag.updateDueDate(for: editingInfo,
                                                                                                      newDueDate: editingInfo.duedate,
                                                                                                      subtitle: NSLocalizedString("Your %@'s %@ is due tomorrow!!", comment: "Notification subtitle"),
                                                                                                      identifier: editingInfo.id, timeInterval: 1)
                                                                        notificationMag.updateDueDate(for: editingInfo,
                                                                                                      newDueDate: editingInfo.duedate,
                                                                                                      subtitle: NSLocalizedString("Did you finish your work? %@ %@ is due.", comment: "Notification subtitle"),
                                                                                                      identifier: editingInfo.id + "td", timeInterval: 0)
                                
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
