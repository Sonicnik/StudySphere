//
//  datePage.swift
//  YCForum
//
//  Created by Sonic Liu on 21/1/2024.
//

import SwiftUI

struct datePage: View {
    
    @Binding var metaInfo: MetaPageInfo
    
    var body: some View {
        
 //       NavigationView {
            VStack(alignment: .leading, spacing: 5) {
                Text("Task")
                    .font(.title2.bold())
                    .padding(.horizontal)
                
                Text(metaInfo.pageDate, style: .date)
                    .font(.callout)
                    .padding(.horizontal)
                
                
                dateCardView(metaInfo: metaInfo)
                    .foregroundColor(.black)
                
                Spacer()
            }
            
            
        //}
        
        
    }
}

#Preview {
    datePage(metaInfo: .constant(sampleMetaPageInfo[0]))
}
