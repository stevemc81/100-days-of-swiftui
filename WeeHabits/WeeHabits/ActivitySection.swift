//
//  ActivitySection.swift
//  WeeHabits
//
//  Created by Steven McWee on 28/02/2023.
//

import SwiftUI

struct ActivitySection: View {
    let activities: [Activity]
    
    var body: some View {
        Section {
            ForEach(activities) { activity in
                NavigationLink {
                    DetailsView(activity: activity)
                } label: {
                    VStack(alignment: .leading) {
                        Text(activity.title)
                            .font(.headline)
                        //Text(activity.description)
                    }
                }
            }
        }
    }
}

struct ActivitySection_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySection(activities: [])
    }
}
