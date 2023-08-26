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
            
            Section(header: Text("Details")) {
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
                DetailEditView(info: $editingInfo)
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
