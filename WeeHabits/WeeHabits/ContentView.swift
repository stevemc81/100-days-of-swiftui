//
//  ContentView.swift
//  WeeHabits
//
//  Created by Steven McWee on 28/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ActivitySection(activities: activities.activities)
            }
            .navigationTitle("Wee Habits")
            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Text("\(Image(systemName: "plus")) New")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
