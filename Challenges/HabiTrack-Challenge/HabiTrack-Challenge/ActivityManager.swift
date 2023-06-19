//
//  ActivityManager.swift
//  HabiTrack-Challenge
//
//  Created by Robert Basamac on 07.06.2023.
//

import Foundation

final class ActivityManager: ObservableObject {
    @Published var activities: [Activity] = []
    
    func addActivity(title: String, description: String, count: Int = 0) {
        let activity = Activity(title: title, description: description, count: count)
        
        activities.append(activity)
    }
}
