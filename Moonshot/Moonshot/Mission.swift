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
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
