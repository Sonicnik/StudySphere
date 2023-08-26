//
//  ThemePicker.swift
//
//
//  Created by Sonic Liu on 6/7/2023.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selectTheme: Theme
    
    var body: some View {
        Picker("Theme", selection: $selectTheme) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selectTheme: .constant(.periwinkle))
    }
}
