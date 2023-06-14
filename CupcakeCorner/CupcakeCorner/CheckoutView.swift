//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Robert Basamac on 14.06.2023.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CheckoutView(order: Order())
}
