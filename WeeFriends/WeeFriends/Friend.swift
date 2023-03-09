//
//  Friend.swift
//  WeeFriends
//
//  Created by Steven McWee on 09/03/2023.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}
