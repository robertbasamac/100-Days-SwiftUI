//
//  ViewModel.swift
//  CompanyUsers-Challenge
//
//  Created by Robert Basamac on 29.06.2023.
//

import Foundation
import SwiftUI
import CoreData

@MainActor
final class ViewModel: ObservableObject {
    
    @Published var users: [CachedUser] = []
    
    private let container: NSPersistentContainer
    private let containerName: String = "CachedDataModel"
    private let entityName: String = "CachedUser"

    init() {
        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error {
                print("Error loading CoreData, \(error)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
            
            
            Task {
                await self.getUsers()
                await self.fetchUsers()
            }
        }
    }
    
    func fetchUsers() async {
        if !users.isEmpty {
            print("Users already loaded from database")
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("URL could not be properly created.")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let returnedUsers = try decoder.decode([User].self, from: data)
            
            for user in returnedUsers {
                let cachedUser = CachedUser(context: container.viewContext)
                
                cachedUser.id = user.id
                cachedUser.isActive = user.isActive
                cachedUser.name = user.name
                cachedUser.age = Int16(user.age)
                cachedUser.company = user.company
                cachedUser.email = user.email
                cachedUser.address = user.address
                cachedUser.about = user.about
                cachedUser.registered = user.registered
                cachedUser.tags = user.tags.joined(separator: ",")
                
                for friend in user.friends {
                    let cachedFriend = CachedFriend(context: container.viewContext)
                    
                    cachedFriend.id = friend.id
                    cachedFriend.name = friend.name
                    
                    cachedUser.addToFriends(cachedFriend)
                }
                
                try container.viewContext.save()
            }
        } catch {
            print("Error while retreiving data, \(error.localizedDescription)")
        }
    }
    
    func getUsers() async {
        let request = NSFetchRequest<CachedUser>(entityName: entityName)
        
        do {
            users = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching Portofolio Entities, \(error)")
        }
    }
}
