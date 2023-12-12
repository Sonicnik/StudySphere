//
//  Settings.swift
//  YCForum
//
//  Created by Sonic Liu on 3/11/2023.
//

import Foundation

struct Settings {
    var avaliableTime: String
    
    
    init(avaliableTime: String){
        self.avaliableTime = avaliableTime
    }
}

extension Settings {
    static let sampleSetting: Settings = Settings(avaliableTime: "2")
}
