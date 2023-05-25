//
//  ContentView.swift
//  Moonshot
//
//  Created by Robert Basamac on 15.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var listedAsList = true
    
    var body: some View {
        NavigationStack {
            Group {
                if listedAsList {
                    ListLayout(astronauts: astronauts, missions: missions)
                } else {
                    GridLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        listedAsList.toggle()
                    } label: {
                        Image(systemName: listedAsList ? "square.grid.2x2" : "list.bullet")
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
