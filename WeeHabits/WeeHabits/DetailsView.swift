//
//  DetailsView.swift
//  WeeHabits
//
//  Created by Steven McWee on 28/02/2023.
//

import SwiftUI

struct DetailsView: View {
    let activity: Activity
    @ObservedObject var activities: Activities
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text(activity.title)
                        .font(.title3.bold())
                        .padding(.bottom)
                    
                    Text(activity.description)
                    
                    Text("You have done this \(activity.completed) times.")
                    
                    Button("Complete") {
                        increment(activity: activity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)
            }
        }
    }
    
    func increment(activity: Activity) {
        var newActivity = activity
        var activityIndex = activities.activities.firstIndex(of: activity) ?? 0
        
        newActivity.completed += 1
        activities.activities[activityIndex] = newActivity
    }
}

struct DetailsView_Previews: PreviewProvider {
    static let activity = Activity(title: "Test title", description: "Test description")
    
    static var previews: some View {
        DetailsView(activity: activity, activities: Activities())
    }
}
