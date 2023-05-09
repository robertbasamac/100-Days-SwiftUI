//
//  ContentView.swift
//  iExpense
//
//  Created by Robert Basamac on 09.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(expenses.items) { item in
                        if item.type == .personal {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundColor(item.amount < 10 ? Color.green : item.amount < 100 ? Color.orange : Color.red)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: {
                    Text("Personal")
                }
                
                Section {
                    ForEach(expenses.items) { item in
                        if item.type == .business {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    
//                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundColor(item.amount < 10 ? Color.green : item.amount < 100 ? Color.orange : Color.red)
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }  header: {
                    Text("Business")
                }
                
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
