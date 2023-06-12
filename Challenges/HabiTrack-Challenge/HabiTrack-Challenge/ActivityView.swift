//
//  ActivityView.swift
//  HabiTrack-Challenge
//
//  Created by Robert Basamac on 07.06.2023.
//

import SwiftUI

struct ActivityView: View {
    
    let activity: Activity
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(activity.description)
                    .padding(.bottom)

                Text("This activity has been done \(activity.count) times.")
                    .multilineTextAlignment(.leading)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle(activity.title)
    }
}

struct ActivityView_Previews: PreviewProvider {
    
    static private var activity: Activity = Activity(title: "Homework", description: "This is my homework activity description.", count: 10)
    
    static var previews: some View {
        NavigationStack {
            ActivityView(activity: activity)
                .navigationTitle(activity.title)
        }
    }
}
