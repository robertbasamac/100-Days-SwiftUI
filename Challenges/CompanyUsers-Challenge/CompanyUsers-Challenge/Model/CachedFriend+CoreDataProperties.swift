//
//  CachedFriend+CoreDataProperties.swift
//  CompanyUsers-Challenge
//
//  Created by Robert Basamac on 29.06.2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var friends: NSSet?

    var wrappedName: String {
        return name ?? "Unknown name"
    }
}

// MARK: Generated accessors for friends
extension CachedFriend {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedUser)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedUser)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedFriend : Identifiable {

}
