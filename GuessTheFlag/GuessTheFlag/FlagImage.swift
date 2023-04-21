//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Robert Basamac on 21.04.2023.
//

import SwiftUI

struct FlagImage: View {
    
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct FlagImage_Previews: PreviewProvider {
    
    static var previews: some View {
        FlagImage(country: "Spain")
    }
}
