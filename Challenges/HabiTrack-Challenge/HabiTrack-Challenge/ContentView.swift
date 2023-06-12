//
//  ContentView.swift
//  HabiTrack-Challenge
//
//  Created by Robert Basamac on 06.06.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var activityManager: ActivityManager = ActivityManager()
    
    @State private var showAddActivity: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activityManager.activities) { activity in
                    NavigationLink {
                        ActivityView(activity: activity)
                    } label: {
                        Text(activity.title)
                    }
                }
            }
            .navigationTitle("Activities")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        showAddActivity.toggle()
                    } label: {
                        Image(systemName: "plus") 
                    }
                }
            }
            .sheet(isPresented: $showAddActivity) {
                AddActivityView()
                    .environmentObject(activityManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
