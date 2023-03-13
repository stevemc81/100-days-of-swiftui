//
//  CachedUser+CoreDataProperties.swift
//  WeeFriends
//
//  Created by Steven McWee on 13/03/2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var friend: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?

    var wrappedName: String {
        name ?? "Unknown"
    }
    
    var wrappedCompany: String {
        company ?? "No job"
    }
    
    var wrappedAbout: String {
        about ?? "No bio"
    }
    
    var wrappedAddress: String {
        address ?? "No address"
    }
    
    var wrappedEmail: String {
        email ?? "No email"
    }
    
    var wrappedRegistered: Date {
        registered ?? Date.now
    }
    
    var wrappedID: UUID {
        id ?? UUID()
    }
    
    public var friendsArry: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
