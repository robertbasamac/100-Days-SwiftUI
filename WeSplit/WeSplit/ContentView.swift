//
//  ContentView.swift
//  WeSplit
//
//  Created by Robert Basamac on 24.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount: Double = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 10
    
    @FocusState private var amountIsFocused: Bool
    
    private var currency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currency?.identifier ?? "$")
    
    private let tipPercentages = [10, 15, 20, 25, 0]
    
    private var grandTotal: Double {
        let tipValue = checkAmount / 100 * Double(tipPercentage)
        return checkAmount + tipValue
    }
    
    private var totalPerPerson: Double {
        let tipValue = checkAmount / 100 * Double(tipPercentage)
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / Double(numberOfPeople)
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                                .tag($0)
                        }
                    }
                } header: {
                    Text("Enter the amount and the number of people")
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                                .tag($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: currency)
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(grandTotal, format: currency)
                        .foregroundColor(tipPercentage == 0 ? .red : .primary)
                } header: {
                    Text("Grand total")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()

                    Button {
                        amountIsFocused = false
                    } label: {
                        Text("Done")
                    }

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
