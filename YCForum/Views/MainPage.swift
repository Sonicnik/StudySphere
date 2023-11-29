//
//  Mainpage.swift
//  YCForum
//
//  Created by Sonic Liu on 4/7/2023.
//
//
import SwiftUI

struct Mainpage: View {
    @StateObject private var stores = storePageInfo()
    @Binding var info: [PageInfo]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewEditView = false
    @Binding var selectedSubject: Set<Subject>
    @ObservedObject var saveSettings = SaveSettings()
    let saveAction: () -> ()
    let notificationManag = NotificationManager.instance
    let defaults = UserDefaults.standard
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                if info.isEmpty{
                    
                    EmptyView(isPresentingNewEditView: $isPresentingNewEditView)
                    
                } else {
                    
                    List{
                        

                        ForEach($info) {$info in
                            NavigationLink(destination: DetailPage(info: $info, selectedSubject: $saveSettings.selectedSubject)) {
                                CardView(info: info)
                                
                                
                            }
                            
                            
                            .onAppear(perform: {
                                sortData(avaible: "1")
                                
                            
                                
                            })
                            .listRowBackground(subjectColor(subject: info.subjects))
                            
                        }
                        
                        .onDelete(perform: deleteItem)
                        .onChange(of: info) { _ in
                            Task {
                                do {
                                    try await stores.SaveInfo(infos: info)
                                } catch {
                                    // Handle errors appropriately
                                    print("Failed to save info: \(error)")
                                }
                            }
                        }
                        .onDisappear( perform: {
                            Task {
                                do {
                                    try await stores.SaveInfo(infos: info)
                                } catch {
                                    // Handle errors appropriately
                                    print("Failed to save info: \(error)")
                                }
                            }
                        })


                        
                    }
                    
                    
                    
                    
                    
                    .listStyle(InsetGroupedListStyle())
                }
                
            }
            .navigationTitle("All")
            .toolbar {
                EditButton()
                Button(action: {
                    isPresentingNewEditView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New")
            }
        }
        
        .sheet(isPresented: $isPresentingNewEditView) {
            NewSheet(infos: $info, isPresentingNewEditView: $isPresentingNewEditView, selectedSubject: $saveSettings.selectedSubject)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                notificationManag.requestAuthorization()
            }
            
            saveSettings.loadSettings()
            print(saveSettings.selectedSubject)
        }
    }
    
    
}


struct Mainpage_Previews: PreviewProvider {
    static var previews: some View {
        Mainpage(info: .constant(PageInfo.sampleData), selectedSubject: .constant([.BM, .Chemistry]), saveAction: {})
    }
}

