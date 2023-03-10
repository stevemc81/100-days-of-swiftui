//
//  DetailsView.swift
//  WeeFriends
//
//  Created by Steven McWee on 10/03/2023.
//

import SwiftUI

struct DetailsView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    Text("Basics")
                        .font(.headline)
                    Text("Age: \(user.age)")
                    Text("Company: \(user.company)")
                    Text("Email: \(user.email)")
                    Text("Address: \(user.address)")
                    Text("Registered: \(user.registered.formatted(date: .abbreviated, time: .omitted))")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Group {
                    Text("Description")
                        .font(.headline)
                    Text(user.about)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()
                
                Group {
                    Text("Tags")
                        .font(.headline)
                    Text(commaSeparatedList(list: user.tags))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Group {
                    Text("Friends")
                        .font(.headline)
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
            
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        
    }
    
    func commaSeparatedList(list: [String]) -> String {
        var outputString: String = ""
        outputString.append(list.map{ "\($0)" }.joined(separator: ", "))
        return outputString
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
