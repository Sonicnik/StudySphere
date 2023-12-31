//
//  BioView.swift
//  YCForum
//
//  Created by Sonic Liu on 21/11/2023.
//

import SwiftUI

struct BioPage: View {
    let DefaultURL = URL(string: "https://github.com/Sonicnik/StudySphere")!
    let DefaultEmail = URL(string: "200037618@hkstudent.ycis.com")!
    
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("INFO")) {
                    VStack {
                        Image("LaunchScreen")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        Text("      StudySphere is an application that's developed by a small group of the students in YCIS year 12. With this app, we hope to help students keep up with their deadlines without spending time organizing what to do.")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .padding()
                        
                    }
                    .padding(.vertical)
                    
                    Link("Check out our Github Repository! 🤩", destination: DefaultURL)
                        .font(.headline)
                    
                }
                
                Section(header: Text("Problems")) {
                    Text("Feel free to contact us!")
                    
                }
                
                
                
            }
        }
        .navigationBarTitle(Text("Who are we?"), displayMode: .inline)

        
        
    }
}

#Preview {
    BioPage()
}
