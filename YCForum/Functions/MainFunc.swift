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
        let avaliableTime = defaults.value(forKey: "AvaliableTime")
        
        var timeLeft: Int = 0
        if avaliableTime == nil {
            timeLeft = 60
        } else {
            timeLeft = (Int(avaliableTime as! String) ?? 0)*60
        }
        // The time passed on is in hours so convert into minutes first
        
        print(timeLeft)
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
        var x = 0
        while(timeLeft > 0) {
            if x == i {
                break
            }
            if timeLeft > info[x].eTime {
                info[x].isHidden = false
                timeLeft = timeLeft - info[x].eTime
            } else if timeLeft < info[x].eTime{
                info[x].isHidden = true
            }
            x += 1

        }
        print(info)



    }
    
    func subjectColor(subject: Subject) -> Color{
        var color: Theme = .bubblegum
        
        switch subject{
        case .Economics:
            color = .purple
            
        case .BM:
            color = .bubblegum
            
        case .Chemistry:
            color = .periwinkle
            
        case .CS:
            color = .magenta
            
        case .Mathematics:
            color = .seafoam
            
        case .Physics:
            color = .sky
            
        case .Chinese:
            color = .tan
            
        case .English:
            color = .teal
            
        case .VA:
            color = .buttercup
            
        case .DT:
            color = .sky
            
        case .Psychology:
            color = .magenta
            
        case .ESS:
            color = .sky
            
        case .TOK:
            color = .poppy
            
        case .CAS:
            color = .periwinkle
            
        case .EE:
            color = .tan
            
        case .Biology:
            color = .seafoam
        case .noChoice:
            color = .sky
        case .History:
            color = .bubblegum
        case .Geography:
            color = .magenta
        }
        
        return color.mainColor

    }
}
