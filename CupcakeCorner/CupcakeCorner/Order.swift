//
//  Order.swift
//  CupcakeCorner
//
//  Created by Robert Basamac on 14.06.2023.
//

import SwiftUI

final class Order: ObservableObject {
    static let types: [String] = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type: Int = 0
    @Published var quantity: Int = 3
    
    @Published var specialRequestEnabled: Bool = false {
        didSet {
            extraFrosting = false
            addSprinkles = false
        }
    }
    @Published var extraFrosting: Bool = false
    @Published var addSprinkles: Bool = false
}