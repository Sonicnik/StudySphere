//
//  Mainpage.swift
//  YCForum
//
//  Created by Sonic Liu on 4/7/2023.
//

import SwiftUI

struct Mainpage: View {
    @Binding var info: [PageInfo]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewEditView = false
    let saveAction: () -> ()
    
    var body: some View {
        NavigationStack {
            List($info) { $info in
                Section{
                    NavigationLink(destination: DetailView(info: $info)) {
                        CardView(info: info)
                    }
                    
                    .listRowBackground(info.theme.mainColor)
                }
                
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("All")
            .toolbar {
                Button(action: {
                    isPresentingNewEditView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Suggestion")
            }
        }
        .sheet(isPresented: $isPresentingNewEditView) {
            NewSheet(infos: $info, isPresentingNewEditView: $isPresentingNewEditView)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct Mainpage_Previews: PreviewProvider {
    static var previews: some View {
        Mainpage(info: .constant(PageInfo.sampleData), saveAction: {})
    }
}
