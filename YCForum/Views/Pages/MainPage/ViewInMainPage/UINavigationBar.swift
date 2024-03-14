//
//  UINavigationBar.swift
//  YCForum
//
//  Created by Sonic Liu on 11/3/2024.
//

import SwiftUI

struct UINavigationBar: View {
    var body: some View {
        HStack{
            Text("Home")
                .font(.title).bold()
                .foregroundStyle(.primary)
                
            Spacer()
            Image(systemName: "info.circle.fill")
                .font(.system(size: 28))
                .frame(width: 44, height: 44, alignment: .trailing)
        }
        .frame(height: 52)
        .padding()
        .padding(.top, 49)
        .backgroundBlur(radius: 20, opaque: true)
        .background()
        .ignoresSafeArea()
    }
}

#Preview {
    UINavigationBar()
}
