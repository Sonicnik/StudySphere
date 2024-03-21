//
//  ThemePicker.swift
//
//
//  Created by Sonic Liu on 6/7/2023.
//

import SwiftUI

struct PickerView: View {
    @Binding var selectTheme: Theme
    @Binding var selectSubject: Subject
    @Binding var selectFormat: Format
    @Binding var selectedSubject: Set<Subject>
    @Binding var customFormat: String //Add this binding property
    
    var body: some View {
        VStack {
            Picker("Subject", selection: $selectSubject) {
                ForEach(Array(selectedSubject), id: \.self) { subject in
                    Text(subject.name).tag(subject)
                }
            }
            
            Picker("Format", selection: $selectFormat) {
                ForEach(Format.allCases) { format in
                    FormatView(format: format)
                        .tag(format)
                }
            }
            
            if selectFormat == .customize {
                TextField("Enter Custom Work Type", text: $customFormat)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(
            selectTheme: .constant(.periwinkle),
            selectSubject: .constant(.Mathematics),
            selectFormat: .constant(.exam),
            selectedSubject: .constant([.BM, .Chinese, .Economics, .English]),
            customFormat: .constant("")
        )
    }
}
