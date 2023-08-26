//
//  Theme.swift
//
//  Created by Sonic Liu on 4/7/2023.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var accentColor: Color {
        let mainColorBrightness = mainColor.brightness
        return mainColorBrightness > 0.5 ? .black : .white
    }
    
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
    var id: String {
        name
    }
}


extension Color {
    var brightness: Double {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &opacity)
        return Double(0.299 * red + 0.587 * green + 0.114 * blue)
    }
}

