//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Steven McWee on 06/03/2023.
//

import CoreData
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
    
    init(filter: String, filterType: FilterType = .begins, sortDescriptors: [SortDescriptor<Singer>]) {
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "lastName \(filterType.rawValue) %@", filter))
    }
}

/* What follows is a FilteredList struct which is generic to work with any entity and filter on any field type

struct GenericFilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    // This is our content closure. We call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterType: FilterType = .begins, sortDescriptors: [SortDescriptors<T>] = [], filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(filterType.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}

*/

//struct FilteredList_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredList()
//    }
//}
