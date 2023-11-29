//
//  SaveSettings.swift
//  YCForum
//
//  Created by Sonic Liu on 18/11/2023.
//

import SwiftUI



class SaveSettings: ObservableObject {
    @Published var selectedSubjects: Set<Subject> = [.noChoice]

    init() {
        loadSettings()
    }

    // Method to load settings
    func loadSettings() {
        if let savedData = UserDefaults.standard.data(forKey: "selectedSubjects"),
           let loadedSubjects = try? JSONDecoder().decode([Subject].self, from: savedData) {
            selectedSubjects = Set(loadedSubjects)
        }
    }

    // Method to save settings
    func saveSettings() {
        do {
            let data = try JSONEncoder().encode(Array(selectedSubjects))
            UserDefaults.standard.set(data, forKey: "selectedSubjects")
        } catch {
            print("Failed to save subjects")
        }
    }
}
