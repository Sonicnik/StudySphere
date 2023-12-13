//
//  saveTime.swift
//  YCForum
//
//  Created by Sonic Liu on 13/12/2023.
//

import Foundation


class saveTime: ObservableObject {
    @Published var avaliableTime: String = "1"
    let defaults = UserDefaults.standard
    
    func saveAvaliableTime(_ time: String) {
        defaults.set(time, forKey: "AvaliableTime")
    }
    
    func loadAvaliableTime(){
        if let savedTimeData = defaults.data(forKey: "AvaliableTime") {
            if let savedTime = String(data: savedTimeData, encoding: .utf8) {
                avaliableTime = savedTime
            }
        }
    }
    
    
    
}
