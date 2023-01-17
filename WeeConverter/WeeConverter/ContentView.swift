//
//  ContentView.swift
//  WeeConverter
//
//  Created by Steven McWee on 17/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var inputAmount = 0.0
    @State private var inputUnit = "meters"
    @State private var outputUnit = "feet"
    @FocusState private var valueIsFocused: Bool
    
    let units = ["meters", "feet", "yards", "kilometers", "miles"]
    
    // Convert any user input to meters
    var inputInMeters: Double {
        let input = inputAmount
        
        switch inputUnit {
        case "meters":
            return input
        case "feet":
            return input / 3.28084
        case "yards":
            return input / 1.09361
        case "kilometers":
            return input * 1000
        case "miles":
            return input * 1609.34
        default:
            return 0
        }
    }
    
    // Convert from meters to chosen output
    var output: Double {
        let input = inputInMeters
        
        switch outputUnit {
        case "meters":
            return input
        case "feet":
            return input * 3.28084
        case "yards":
            return input * 1.09361
        case "kilometers":
            return input / 1000
        case "miles":
            return input / 1609.34
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value", value: $inputAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($valueIsFocused)
                    
                } header: {
                    Text("Distance")
                }
                
                Section {
                    Picker("From", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    
                    Picker("To", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Convert")
                }
                
                Section {
                    Text("\(inputAmount, format: .number) \(inputUnit) is \(output, format: .number) \(outputUnit)")
                }
            }
            .navigationTitle("Wee Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        valueIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
