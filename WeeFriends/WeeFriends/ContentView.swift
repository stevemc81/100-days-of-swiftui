//
//  ContentView.swift
//  WeeFriends
//
//  Created by Steven McWee on 09/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id: \.id) { user in
                HStack {
                    Text("\(user.name)")
                    
                    if user.isActive {
                        Text("Active")
                            .foregroundColor(.green)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    } else {
                        Text("Offline")
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .navigationTitle("Friend Face")
            .task {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        // Create URL to query
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid url")
            return
        }
        
        // Create the data request
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let decoder = JSONDecoder()
        
        // Set the date decoding strategy
        decoder.dateDecodingStrategy = .iso8601
        
        // Fetch data
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedData = try decoder.decode([User].self, from: data)
            users = decodedData
        } catch {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
