//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Steven McWee on 24/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order() // This is the creation of the order. Only happens once.
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.data.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.data.quantity)", value: $order.data.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.data.specialRequestEnabled.animation())
                    
                    if order.data.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.data.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.data.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
