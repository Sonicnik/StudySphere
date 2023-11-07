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
    
    var body: some View {
        
        
        Picker("Subject", selection: $selectSubject){
            ForEach(Subject.allCases) { subject in
                SubjectView(subject: subject)
                    .tag(subject)
            }
        }
        Picker("Format", selection: $selectFormat){
            ForEach(Format.allCases) { format in
                FormatView(format: format)
                    .tag(format)
            }
        }
        
        
        
        
        
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(selectTheme: .constant(.periwinkle), selectSubject: .constant(.MATH), selectFormat: .constant(.Exam))
    }
}
