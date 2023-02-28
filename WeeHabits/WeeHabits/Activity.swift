//
//  Activity.swift
//  WeeHabits
//
//  Created by Steven McWee on 28/02/2023.
//

import Foundation

// Struct for a single activity
struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
}
