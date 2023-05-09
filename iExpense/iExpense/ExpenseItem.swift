//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Robert Basamac on 09.05.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}
