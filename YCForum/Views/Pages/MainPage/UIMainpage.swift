//
//  UIMainpage.swift
//  YCForum
//
//  Created by Sonic Liu on 11/3/2024.
//

import SwiftUI

struct UIMainpage: View {
    @Binding var info: [MetaPageInfo]
    
    var body: some View {
        VStack {
            UINavigationBar()
            MiniCalendar(info: $info)
            Spacer()
            
            
        }
    }
}

#Preview {
    UIMainpage(info: .constant(MetaPageInfo.sampleMetaPageInfo))
}
