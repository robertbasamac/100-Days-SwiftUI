//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Robert Basamac on 14.06.2023.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order: Order
    
    var body: some View {
        Text("Order")
    }
}

#Preview {
    AddressView(order: Order())
}
