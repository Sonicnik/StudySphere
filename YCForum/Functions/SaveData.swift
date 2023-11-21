//
//  SaveData.swift
//  YCForum
//
//  Created by Sonic Liu on 1/9/2023.
//

import SwiftUI

@MainActor
class storePageInfo: ObservableObject {
    @Published var infoData: [PageInfo] = []
    private static func fetchDirectory() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("info.data")
    }
    

    // Method to save data
    func SaveInfo(infos:[PageInfo]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(infos)
            let outfile = try Self.fetchDirectory()
            try data.write(to: outfile)
        }
        _ = try await task.value
        // Implement the saving logic here
        // Example using UserDefaults
        let data = try JSONEncoder().encode(infoData)
        UserDefaults.standard.set(data, forKey: "info")
    }

    // Method to load data
    func LoadInfo() async throws {
        let task = Task<[PageInfo], Error> {
            let directory = try Self.fetchDirectory()
            guard let data = try? Data(contentsOf: directory) else {
                return []
            }
            let pageInfo = try JSONDecoder().decode([PageInfo].self, from: data)
            return pageInfo
        }
        let info = try await task.value
        self.infoData = info
    }
}
