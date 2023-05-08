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
    @State private var streak: Int = 0
    
    @State private var tappedFlag: Int? = nil
    
    @State private var countries: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswers: Int = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top , startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tag the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.medium))
                        
                        Text(countries[correctAnswers])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundColor(Color(red: 0.76, green: 0.15, blue: 0.26))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(country: countries[number])
                                .rotation3DEffect(.degrees(tappedFlag == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .scaleEffect(tappedFlag == nil ? 1 : tappedFlag == number ? 1.0 : 0.75)
                                .opacity(tappedFlag == nil ? 1 : tappedFlag == number ? 1.0 : 0.75)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                Text("Streak: \(streak)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    resetScore()
                } label: {
                    Text("Reset")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .font(.title2.bold())
                        .background(Color(red: 0.1, green: 0.2, blue: 0.45))
                        .shadow(radius: 5)
                        .cornerRadius(20)
                }
                

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") {
                askQuestion()
                tappedFlag = nil
            }
        } message: {
            Text("Your score is \(scoreTitle)")
        }
    }
    
    func flagTapped(_ number: Int) {
        withAnimation {
            tappedFlag = number
        }
        
        if number == correctAnswers {
            scoreTitle = "Correct"
            streak += 1
        } else {
            scoreTitle = "Wrong"
            resetScore()
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswers = Int.random(in: 0...2)
    }
    
    func resetScore() {
        streak = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
