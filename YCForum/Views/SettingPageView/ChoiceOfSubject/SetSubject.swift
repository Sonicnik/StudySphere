//
//  SelectSubject.swift
//  YCForum
//
//  Created by Sonic Liu on 18/11/2023.
//

import SwiftUI

struct SetSubject: View {
    @Binding var selectedSubjects: Set<Subject>
    
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
    SetSubject(selectedSubjects: .constant([.BM, .CS, .Chemistry]))
}
