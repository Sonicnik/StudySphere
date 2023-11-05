//
//  SubjectView.swift
//  YCForum
//
//  Created by Sonic Liu on 26/8/2023.
//

import SwiftUI

struct SubjectView: View {
    let subject: Subject
    var body: some View {
        Text(subject.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct SubjectView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(subject: .MATH)
    }
}
