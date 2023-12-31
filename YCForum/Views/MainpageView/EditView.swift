//
//  EditView.swift
//  
//
//  Created by Sonic Liu on 5/7/2023.
//

import SwiftUI

struct EditView: View {
    @Binding var info: PageInfo
    @Binding var selectedSubject: Set<Subject>
    
    var body: some View {
        Form {
            Section(header: Text("Info ")) {
                
                TextField("Enter the title", text: $info.title)
                
                
                
                PickerView(selectTheme: $info.theme, selectSubject: $info.subjects, selectFormat: $info.formats, selectedSubject: $selectedSubject)
                datePicker(selectedDate: $info.duedate)
                
                
                
            }
            
            Section(header: Text("Time Estimated")) {
                timeSelectionPicker(eTime: $info.eTime)
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
        EditView(info: .constant(PageInfo.sampleData[0]), selectedSubject: .constant([.BM, .Chemistry, .Economics]))
    }
}
