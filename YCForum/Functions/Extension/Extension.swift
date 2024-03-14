//
//  Extension.swift
//  YCForum
//
//  Created by Sonic Liu on 13/3/2024.
//

import SwiftUI

extension View {
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        self
            .background(
                Blur(radius: radius, opaque: opaque)
            )
    }
}
