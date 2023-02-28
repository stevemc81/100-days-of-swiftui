//
//  AddView.swift
//  WeeHabits
//
//  Created by Steven McWee on 28/02/2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let activity = Activity(title: title, description: description)
                    activities.activities.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
