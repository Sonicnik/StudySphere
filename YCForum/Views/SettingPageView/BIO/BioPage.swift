//
//  BioView.swift
//  YCForum
//
//  Created by Sonic Liu on 21/11/2023.
//

import SwiftUI

struct BioPage: View {
    let GITURL = URL(string: "https://github.com/Sonicnik/StudySphere")!
    let IGURL = URL(string: "https://www.instagram.com/studysphere__/")!
    
    let DefaultEmail = URL(string: "200037618@hkstudent.ycis.com")!
    
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Setting.secInfo-String")) {
                    VStack {
                        Image("LaunchScreen")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        Text("Bio.Intro-String")
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                    }
                    .padding(.vertical)
                    
                    
                    
                }
                
                Section(header: Text("Bio.secFeb")) {
                    Link("Bio.Git-String", destination: GITURL)
                        .font(.headline)
                    Link("Bio.ins-String", destination: IGURL)
                        .font(.headline)
                    
                }
                
                
                
            }
        }
        .navigationBarTitle(Text("Bio.title-String"), displayMode: .inline)

        
        
    }
}

#Preview {
    BioPage()
}
