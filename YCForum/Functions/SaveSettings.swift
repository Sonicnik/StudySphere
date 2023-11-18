//
//  SaveSettings.swift
//  YCForum
//
//  Created by Sonic Liu on 18/11/2023.
//

import SwiftUI

import SwiftUI

class SaveSettings: ObservableObject {
    @Published var selectedSubjects: Set<Subject> = [] {
        didSet {
            saveSelectedSubjects()
        }
    }
    
    init() {
        loadSelectedSubjects()
    }
    
    private func loadSelectedSubjects() {
        if let savedData = UserDefaults.standard.data(forKey: "selectedSubjects"),
           let loadedSubjects = try? JSONDecoder().decode([Subject].self, from: savedData) {
            selectedSubjects = Set(loadedSubjects)
        }
    }
    
    private func saveSelectedSubjects() {
        let encodedData = try? JSONEncoder().encode(Array(selectedSubjects))
        UserDefaults.standard.set(encodedData, forKey: "selectedSubjects")
    }
}

