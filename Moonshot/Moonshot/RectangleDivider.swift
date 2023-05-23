//
//  RectangleDivider.swift
//  Moonshot
//
//  Created by Robert Basamac on 23.05.2023.
//

import SwiftUI

struct RectangleDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct RectangleDivider_Previews: PreviewProvider {
    static var previews: some View {
        RectangleDivider()
    }
}
