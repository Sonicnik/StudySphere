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
    
    func sortData(){
        var i = info.count - 1
        while(i > 0) {
            var j = 0
            while(j < i) {
                if info[j].duedate > info[j + 1].duedate {
                    info.swapAt(j, j + 1)
                }
                j += 1
            }
            i -= 1
        }
    }
}
