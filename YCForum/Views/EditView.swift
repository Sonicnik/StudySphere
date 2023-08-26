//
//  EditView.swift
//  
//
//  Created by Sonic Liu on 5/7/2023.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var info: PageInfo
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                TextField("Title", text: $info.title)
                
                TextField("Publishers", text: $info.publisher)
                
                ThemePicker(selection: $info.theme)
            }

            Section(header: Text("Explanation")) {
                TextField("Explanation", text: $info.detail)
            }
                
                
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(info: .constant(PageInfo.sampleData[0]))
    }
}
