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
        }
        .accentColor(.blue)
        .padding()
    }
}

#Preview {
    SetSubject(selectedSubjects: .constant([.BM, .CS, .Chemistry]))
}
