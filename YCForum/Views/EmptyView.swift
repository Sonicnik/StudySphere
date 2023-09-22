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
                Text("There are no work to do!!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you working towards your goals?")
                    .padding(.bottom)
                
                Button {
                    isPresentingNewEditView = true
                } label: {
                    Text("Push, Push, PUSH!! ✊")
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
