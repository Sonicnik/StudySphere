//
//  MainFunc.swift
//  YCForum
//
//  Created by Sonic Liu on 22/9/2023.
//
import SwiftUI

extension Mainpage {
    func deleteItem(at offsets: IndexSet) {
        info.remove(atOffsets: offsets)
    }
    
    func moveItem(from source: IndexSet, to destination: Int) {
        info.move(fromOffsets: source, toOffset: destination)
    }
}
