//
//  IntroPageView.swift
//  YCForum
//
//  Created by Sonic Liu on 30/11/2023.
//

import SwiftUI

struct introPageView: View {
    
    var introPage: introPageType
    
    var body: some View {
        VStack(spacing: 20) {
            Image("\(introPage.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(40)
                .background(.gray.opacity(0.10))
                .cornerRadius(10)
                .padding()
            
            Text(introPage.name)
                .font(.title)
            
            Text(introPage.description)
                .font(.subheadline)
                .padding()
        }
    }
}

#Preview {
    introPageView(introPage: introPageType.sampleIntroPage)
}
