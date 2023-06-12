//
//  Activity.swift
//  HabiTrack-Challenge
//
//  Created by Robert Basamac on 07.06.2023.
//

import Foundation

struct Activity: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let description: String
    let count: Int
}
