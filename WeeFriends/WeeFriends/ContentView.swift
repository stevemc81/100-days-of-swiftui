//
//  ContentView.swift
//  WeeFriends
//
//  Created by Steven McWee on 09/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List(cachedUsers) { user in
                NavigationLink {
                    DetailsView(user: user)
                } label: {
                    HStack {
                        if user.isActive {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 7))
                        } else {
                            Image(systemName: "circle.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 7))
                        }
                        
                        Text("\(user.name!)")
                        
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
            }
            .navigationTitle("Friend Face")
            .task {
                if cachedUsers.isEmpty {
                    await loadData()
                }
                
                await MainActor.run {
                    for user in users {
                        let newUser = CachedUser(context: moc)
                        newUser.name = user.name
                        newUser.id = user.id
                        newUser.isActive = user.isActive
                        newUser.age = Int16(user.age)
                        newUser.about = user.about
                        newUser.email = user.email
                        newUser.address = user.address
                        newUser.company = user.company
                        newUser.registered = user.registered
                        
                        for friend in user.friends {
                            let newFriend = CachedFriend(context: moc)
                            newFriend.id = friend.id
                            newFriend.name = friend.name
                            newFriend.user = newUser
                        }
                        
                        if moc.hasChanges {
                            try? moc.save()
                        }
                    }
                }
                
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
        
        // Fetch data if users array is empty (i.e. don't re-request the data all the time)
        if users.isEmpty {
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                let decodedData = try decoder.decode([User].self, from: data)
                users = decodedData
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
