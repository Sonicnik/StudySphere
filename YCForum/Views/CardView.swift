//
//  CardView.swift
//  
//
//  Created by Sonic Liu on 4/7/2023.
//

import SwiftUI

struct CardView: View {
    let info: PageInfo
    var body: some View {
        VStack(alignment: .leading) {
            Text(info.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            Text(info.detail)
                .font(.subheadline)
        }
        .padding()
        .foregroundColor(info.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var info = PageInfo.sampleData[0]
    static var previews: some View {
        CardView(info: info)
            .background(info.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
