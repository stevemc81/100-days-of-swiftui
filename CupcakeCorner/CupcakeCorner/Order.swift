//
//  Order.swift
//  CupcakeCorner
//
//  Created by Steven McWee on 01/03/2023.
//

import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    @Published var data = OrderModel()
}

struct OrderModel: Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        if name.trimmingCharacters(in: .whitespaces) == "" || streetAddress.trimmingCharacters(in: .whitespaces) == "" || city.trimmingCharacters(in: .whitespaces) == "" || zip.trimmingCharacters(in: .whitespaces) == "" {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2
        
        // Complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1 per cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // 50c per cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
