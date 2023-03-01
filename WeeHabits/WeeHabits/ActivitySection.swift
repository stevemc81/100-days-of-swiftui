//
//  ActivitySection.swift
//  WeeHabits
//
//  Created by Steven McWee on 28/02/2023.
//

import SwiftUI

struct ActivitySection: View {
    let activities: [Activity]
    let deleteActivities: (IndexSet) -> Void
    @ObservedObject var activitiesClass: Activities
    
    var body: some View {
        Section {
            ForEach(activities) { activity in
                NavigationLink {
                    DetailsView(activity: activity, activities: activitiesClass)
                } label: {
                    VStack(alignment: .leading) {
                        Text(activity.title)
                            .font(.headline)
                    }
                }
            }
            .onDelete(perform: deleteActivities)
        }
    }
}

struct ActivitySection_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySection(activities: [], deleteActivities: { _ in }, activitiesClass: Activities())
    }
}
