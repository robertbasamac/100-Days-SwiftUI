//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Robert Basamac on 11.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswers = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tag the flag of")
                    Text(countries[correctAnswers])
                }
                
                ForEach(0..<3) { number in
                    Button {
                        // flag tapped
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
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
