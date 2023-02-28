//
//  DetailsView.swift
//  WeeHabits
//
//  Created by Steven McWee on 28/02/2023.
//

import SwiftUI

struct DetailsView: View {
    let activity: Activity
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading) {
                    Text(activity.title)
                        .font(.title3.bold())
                        .padding(.bottom)
                    
                    Text(activity.description)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static let activity = Activity(title: "Test title", description: "Test description")
    
    static var previews: some View {
        DetailsView(activity: activity)
    }
}
