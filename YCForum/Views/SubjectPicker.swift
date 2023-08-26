//
//  SubjectPicker.swift
//  YCForum
//
//  Created by Sonic Liu on 26/8/2023.
//

import SwiftUI

struct SubjectPicker: View {
    @Binding var selectSubject: Subject
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SubjectPicker_Previews: PreviewProvider {
    static var previews: some View {
        SubjectPicker(selectSubject: .constant(.MATH))
    }
}
