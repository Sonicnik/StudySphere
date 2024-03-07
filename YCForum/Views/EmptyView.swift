//
//  EmptyView.swift
//  YCForum
//
//  Created by Sonic Liu on 22/9/2023.
//

import SwiftUI

struct EmptyView: View {
    @Binding var isPresentingNewEditView : Bool
    
    var body: some View {
        ScrollView {
            VStack {
                Text("EmptyView.title-String")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("EmptyView.Intro-String")
                    .padding(.bottom)
                
                Button {
                    isPresentingNewEditView = true
                } label: {
                    Text("EmptyView.button-String")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 50)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmptyView(isPresentingNewEditView: .constant(true))
                .navigationTitle("Title")
        }
        
    }
}
