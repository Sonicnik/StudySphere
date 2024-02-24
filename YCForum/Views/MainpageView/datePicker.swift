//
//  datePicker.swift
//  YCForum
//
//  Created by Sonic Liu on 10/9/2023.
//

import SwiftUI

struct datePicker: View {
    @Binding var selectedDate: Date
    
    @State private var dueDates = Date()
    
    
    var body: some View {
        HStack {
            Text("Due Date")
            MyDatePicker(selection: $dueDates, minuteInterval: 5)
        }
    }
    
    
    
    
}

struct datePicker_Previews: PreviewProvider {
    static var previews: some View {
        datePicker(selectedDate: .constant(Date()))
    }
}
