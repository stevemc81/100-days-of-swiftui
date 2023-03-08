//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Steven McWee on 06/03/2023.
//

import SwiftUI

enum FilterType: String {
    case begins = "BEGINSWITH"
    case contains = "CONTAINS[c]"
}

struct FilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Singer>
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String, filterType: FilterType = .begins) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName \(filterType.rawValue) %@", filter))
    }
}

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
