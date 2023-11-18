//
//  SelectSubject.swift
//  YCForum
//
//  Created by Sonic Liu on 18/11/2023.
//

import SwiftUI

struct SetSubject: View {
    var body: some View {
        
        HStack {
            Text("Subjects")
            Spacer()
            Image(systemName: "chevron.right")
        }
        .accentColor(.blue)
        .padding()
    }
}

#Preview {
    SetSubject()
}
