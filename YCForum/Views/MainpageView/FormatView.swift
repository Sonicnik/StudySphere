//
//  FormatView.swift
//  YCForum
//
//  Created by Sonic Liu on 26/8/2023.
//

import SwiftUI

struct FormatView: View {
    let format : Format
    var body: some View {
        Text(format.localizedName)
            .padding(4)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct FormatView_Previews: PreviewProvider {
    static var previews: some View {
        FormatView(format: .exam)
    }
}
