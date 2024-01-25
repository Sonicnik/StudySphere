//
//  DateValue.swift
//  YCForum
//
//  Created by Sonic Liu on 20/1/2024.
//

import SwiftUI

struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}

struct MetaPageInfo: Identifiable{
    var id = UUID().uuidString
    var pageinfo: [PageInfo]
    var pageDate: Date
}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var sampleMetaPageInfo: [MetaPageInfo] = [
    MetaPageInfo(pageinfo: [
        PageInfo.sampleData[1],
        PageInfo.sampleData[2],
        PageInfo.sampleData[0]]
    , pageDate: getSampleDate(offset: 0)),
    
    MetaPageInfo(pageinfo: [
        PageInfo.sampleData[2]]
    , pageDate: getSampleDate(offset: -3)),
    
    MetaPageInfo(pageinfo: [
        PageInfo.sampleData[0]]
    , pageDate: getSampleDate(offset: -8)),
    
]
