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
                .font(.title)
                .foregroundStyle(.primary)
                .padding()
            Spacer()
        }
        .frame(height: 44)
    }
}

#Preview {
    UINavigationBar()
}
