//
//  dateCardView.swift
//  YCForum
//
//  Created by Sonic Liu on 21/1/2024.
//

import SwiftUI

struct dateCardView: View {
    
    var metaInfo: MetaPageInfo
    var body: some View {
        
        if !metaInfo.pageinfo.isEmpty {
            Group {                    
                ForEach(metaInfo.pageinfo) {info in
                    NavigationLink(destination: DetailPage(info: info, selectedSubject: .constant([.BM, .Chemistry])){
                            VStack(alignment: .leading, spacing: 10) {
                                
                                
                                HStack {
                                    Text(info.duedate, style: .time)
                                    
                                    Spacer()
                                    
                                    Text("\(info.subjects.rawValue)")
                                }
                                
                                Text(info.title)
                                    .font(.title3.bold())
                                
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(
                                info.theme.mainColor
                                    .opacity(0.5)
                                    .cornerRadius(10)
                            )
                            .padding(.horizontal)
                        }
                        
                    }
                
            }
            .listStyle(InsetGroupedListStyle())
        } else {
            Text("No task found")
        }
        
        
    }
        
}

#Preview {
    dateCardView(metaInfo: sampleMetaPageInfo[1])
}
