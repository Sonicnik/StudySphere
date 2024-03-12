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
    @Binding var metapageinfo: [MetaPageInfo]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewEditView = false
    @Binding var selectedSubject: Set<Subject>
    @Binding var preIntro: Bool
    @ObservedObject var saveSettings = SaveSettings()
    @Binding var avaliableTime: String
    
    let saveAction: () -> ()
    let notificationManag = NotificationManager.instance
    let defaults = UserDefaults.standard
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                if info.isEmpty{
                    
                    VStack {
                        EmptyView(isPresentingNewEditView: $isPresentingNewEditView)
                        Button("Don't know what to do?") {
                            preIntro = true
                        }
                    }
                    
                } else {
                    
                    VStack {
                        List{
                            ForEach($info) {$info in
                                NavigationLink(destination: DetailPage(info: $info, selectedSubject: $saveSettings.selectedSubject)) {
                                    CardView(info: info)
                                }
                                .onAppear(perform: {
                                    sortData(avaible: avaliableTime)
                                })
                                .listRowBackground(subjectColor(subject: info.subjects))
                                
                            }
                            .onDelete(perform: deleteItem)
                            .onChange(of: info) { _ in
                                Task {
                                    do {
                                        // Convert PageInfo to MetaPageInfo
                                        let metaPageInfos = groupPageInfoByDate(pageInfos: info)
                                        // Assuming SaveInfo function or equivalent can handle [MetaPageInfo]
                                        metapageinfo = metaPageInfos
                                        
                                        try await stores.SaveInfo(infos: metaPageInfos)
                                    } catch {
                                        // Handle errors appropriately
                                        print("Failed to save MetaPageInfo: \(error.localizedDescription)")
                                    }
                                }
                            }
                            .onDisappear {
                                Task {
                                    do {
                                        // Convert PageInfo to MetaPageInfo
                                        let metaPageInfos = groupPageInfoByDate(pageInfos: info)
                                        // Assuming SaveInfo function or equivalent can handle [MetaPageInfo]
                                        
                                        metapageinfo = metaPageInfos
                                        
                                        
                                        
                                        try await stores.SaveInfo(infos: metaPageInfos)
                                    } catch {
                                        // Handle errors appropriately
                                        print("Failed to save MetaPageInfo on disappear: \(error.localizedDescription)")
                                    }
                                }
                            }

                        }
                        .listStyle(InsetGroupedListStyle())
                        
                        Spacer()
                    }
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
            NewSheet(infos: $info, isPresentingNewEditView: $isPresentingNewEditView, selectedSubject: $saveSettings.selectedSubject, currentDate: Date())
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                notificationManag.requestAuthorization()
            }
//          Calling notification everyday at 3pm for users to input more works
//            notificationManag.askingNewWork()
//            notificationManag.sendDailyNotificationForUnfinishedWork(info)
            Task {
                info = convertMetaPageInfoToPageInfo(metaPageInfoArray: metapageinfo)
            }
            saveSettings.loadSettings()
            
        }
    }
    
    
}


struct Mainpage_Previews: PreviewProvider {
    static var previews: some View {
        Mainpage(info: .constant(PageInfo.sampleData), metapageinfo: .constant(MetaPageInfo.sampleMetaPageInfo),
                 selectedSubject: .constant([.BM, .Chemistry]),
                 preIntro: .constant(false), avaliableTime: .constant("1"), saveAction: {})
    }
}

