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
    let type: expenseType
    let amount: Double
}

enum expenseType: String, CaseIterable, Codable {
    case personal = "Personal"
    case business = "Business"
}

