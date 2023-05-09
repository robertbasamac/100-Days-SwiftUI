//
//  Expenses.swift
//  iExpense
//
//  Created by Robert Basamac on 09.05.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] = [ExpenseItem]()
}
