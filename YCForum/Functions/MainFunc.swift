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
    
    func sortData(avaible time: String){
        // The time passed on is in hours so convert into minutes first
        var timeLeft = (Int(time) ?? 0)*60
        // First loop used to organize the lists
        
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
        //Second Loop used to organize the available time for the scheduled task.
        i = info.count - 1
        while(i > 0) {
            if timeLeft > info[i].eTime{
                timeLeft = timeLeft - info[i].eTime
            } else if timeLeft < info[i].eTime{
                info[i].isHidden = true
            }
            i -= 1

        }
        print(info)


    }
    
    func subjectColor(subject: Subject) -> Color{
        var color: Theme = .bubblegum
        
        switch subject{
        case .Economics:
            color = .purple
            
        case .Business:
            color = .indigo
            
        case .Chemistry:
            color = .periwinkle
            
        case .CS:
            color = .magenta
            
        case .MATH:
            color = .seafoam
            
        case .Physics:
            color = .sky
            
        case .Chinese:
            color = .tan
            
        case .English:
            color = .teal
        }
        
        return color.mainColor

    }
}
