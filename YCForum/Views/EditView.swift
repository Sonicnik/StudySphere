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
                
                TextField("Publisher", text: $info.publisher)
                
                ThemePicker(selection: $info.theme)
            }

            Section(header: Text("Notes")) {
            // Switched to textEditor for the drop of text boxes to display all of the texts at once.
                TextEditor(text: $info.detail)
                    .frame(minHeight: 240) // Set a minimum height for the TextEditor
                    .lineLimit(nil)       // Allow unlimited lines
                    .multilineTextAlignment(.leading) //Left-align the text
            }
                
                
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(info: .constant(PageInfo.sampleData[0]))
    }
}
