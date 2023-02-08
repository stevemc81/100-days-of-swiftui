//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Steven McWee on 07/02/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
