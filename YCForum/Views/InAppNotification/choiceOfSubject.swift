//
//  choiceOfSubject.swift
//  YCForum
//
//  Created by Sonic Liu on 30/11/2023.
//

import SwiftUI

struct choiceOfSubject: View {
    @Binding var subjectError: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Please Select a Subject")
                .font(.title3)
                .fontWeight(.bold)
            
            Button("OK") {
                subjectError = false
            }
            .padding()
            .frame(width: 150)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
        .frame(width: 300, height: 150)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
    }
}

#Preview {
    choiceOfSubject(subjectError: .constant(true))
}
