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
    @Binding var avaliableSubject: Set<Subject>
    let saveAction: () -> ()
    let notificationManag = NotificationManager.instance
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                if info.isEmpty{
                    
                    EmptyView(isPresentingNewEditView: $isPresentingNewEditView)
                    
                } else {
                    
                    List{
                        

                        ForEach($info) {$info in
                            NavigationLink(destination: DetailPage(info: $info, avaliableSubject: $avaliableSubject)) {
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
            NewSheet(infos: $info, isPresentingNewEditView: $isPresentingNewEditView, avaliableSubject: $avaliableSubject)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                notificationManag.requestAuthorization()
                
            }
        }
    }
    
    
}


struct Mainpage_Previews: PreviewProvider {
    static var previews: some View {
        Mainpage(info: .constant(PageInfo.sampleData), avaliableSubject: .constant([.BM, .Chemistry]), saveAction: {})
    }
}

