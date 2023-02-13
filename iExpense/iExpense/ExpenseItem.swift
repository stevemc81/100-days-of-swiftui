//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Steven McWee on 07/02/2023.
//

import Foundation

// Conform to Equatable so we can get the index of item to remove it from the array when deleting
struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
