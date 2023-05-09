//
//  AddView.swift
//  iExpense
//
//  Created by Robert Basamac on 09.05.2023.
//

import SwiftUI

struct AddView: View {
    
    @Environment (\.dismiss) private var dismiss
    
    @ObservedObject var expenses: Expenses
    
    @State private var name: String = ""
    @State private var type: expenseType = .personal
    @State private var amount: Double = 0.0
    
    enum expenseType: String, CaseIterable {
        case personal = "Personal"
        case business = "Business"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(expenseType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type.rawValue, amount: amount)
                        expenses.items.append(item)
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
