//
//  SaveSettings.swift
//  YCForum
//
//  Created by Sonic Liu on 18/11/2023.
//

import SwiftUI

import SwiftUI



class SaveSettings: ObservableObject {
    @Published var selectedSubjects: Set<Subject> = []

    // Method to save settings
    func saveSettings() {
        if let savedData = UserDefaults.standard.data(forKey: "selectedSubjects"),
           let loadedSubjects = try? JSONDecoder().decode([Subject].self, from: savedData) {
            selectedSubjects = Set(loadedSubjects)
        }
    }

    // Method to load settings
    func loadSettings() {
        let encodedData = try? JSONEncoder().encode(Array(selectedSubjects))
        UserDefaults.standard.set(encodedData, forKey: "selectedSubjects")
        
        guard let data = UserDefaults.standard.data(forKey: "selectedSubjects") else { return }
    }
}
