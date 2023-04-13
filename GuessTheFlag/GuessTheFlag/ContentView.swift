//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Robert Basamac on 11.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    
    @State private var countries: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswers: Int = Int.random(in: 0...2)
    
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
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                askQuestion()
            }
        } message: {
            Text("Your score is \(scoreTitle)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswers {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswers = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
