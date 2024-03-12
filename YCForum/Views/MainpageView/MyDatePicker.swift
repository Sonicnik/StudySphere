//
//  MyDatePicker.swift
//  YCForum
//
//  Created by Sonic Liu on 24/2/2024.
//

import SwiftUI

import SwiftUI

struct MyDatePicker: UIViewRepresentable {
    @Binding var selection: Date
    let minuteInterval: Int

    func makeUIView(context: Context) -> UIDatePicker {
        let picker = UIDatePicker()
        picker.addTarget(context.coordinator, action: #selector(Coordinator.dateChanged), for: .valueChanged)
        return picker
    }

    func updateUIView(_ picker: UIDatePicker, context: Context) {
        picker.minuteInterval = minuteInterval
        picker.date = selection
        picker.datePickerMode = .dateAndTime // Allows selecting both date and time
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: MyDatePicker

        init(_ datePicker: MyDatePicker) {
            self.parent = datePicker
        }

        @objc func dateChanged(_ sender: UIDatePicker) {
            parent.selection = sender.date
        }
    }
}

struct DatePickerDemo: View {
    @State private var selectedDate: Date = Date()

    var body: some View {
        VStack {
            MyDatePicker(selection: $selectedDate, minuteInterval: 5)
        }
    }
}

struct DatePickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerDemo()
    }
}




#Preview {
    MyDatePicker(selection: .constant(Date()), minuteInterval: 5)
}
