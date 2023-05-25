//
//  Mission.swift
//  Moonshot
//
//  Created by Robert Basamac on 15.05.2023.
//

import Foundation



struct Mission: Identifiable, Codable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var formattedLongLaunchDate: String {
        launchDate?.formatted(date: .complete, time: .complete) ?? "N/A"
    }
}
