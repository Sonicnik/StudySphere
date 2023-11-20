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
        guard let data = UserDefaults.standard.data(forKey: "selectedSubjects") else { return }
        do {
            let subjects = try JSONDecoder().decode([Subject].self, from: data)
            selectedSubjects = Set(subjects)
        } catch {
            fatalError()
        }
        

    }
}
