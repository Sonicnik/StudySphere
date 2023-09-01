//
//  SaveData.swift
//  YCForum
//
//  Created by Sonic Liu on 1/9/2023.
//

import SwiftUI

class storeData: ObservableObject {
    @Published var info: [PageInfo] = []
    
    private static func fetchDirectory() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("info.data")
    }
    
    
// Load function for fetching the data stored within the url
    
    func load() async throws {
        let task = Task<[PageInfo], Error> {
            let directory = try Self.fetchDirectory()
            guard let data = try? Data(contentsOf: directory) else {
                return []
            }
            let pageInfo = try JSONDecoder().decode([PageInfo].self, from: data)
            return pageInfo
        }
        let info = try await task.value
        self.info = info

    }
    
    func save(infos: [PageInfo]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(infos)
            let outfile = try Self.fetchDirectory()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
