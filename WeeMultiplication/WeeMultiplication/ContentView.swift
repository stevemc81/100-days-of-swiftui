//
//  ContentView.swift
//  WeeMultiplication
//
//  Created by Steven McWee on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var settingsVisible = true
    @State private var timesTable = 5
    @State private var selectedQuestionsIndex = 0
    var numberOfQuestions = [5, 10, 20]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.teal, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            if settingsVisible {
                // Settings view
                VStack {
                    VStack(spacing: 10) {
                        Text("Wee Multiplication")
                            .font(.largeTitle.bold())
                        
                        Text("Set up your game")
                            .font(.title.bold())
                        
                        Section("Which multiplication table will we practice?") {
                            Picker("times table", selection: $timesTable) {
                                ForEach(2..<13) {
                                    Text("\($0) times table")
                                }
                            }
                            .pickerStyle(.wheel)
                        }
                        
                        Section("And how many questions would you like?") {
                            Picker("Number of questions", selection: $selectedQuestionsIndex) {
                                ForEach(0..<numberOfQuestions.count, id: \.self) {
                                    Text("\(numberOfQuestions[$0])")
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Button("Start game") {
                            settingsVisible = false
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .navigationTitle("Wee Multiplication")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.thinMaterial)
                }
                .padding()
            } else {
                // Game view
                VStack {
                    Button("Back to settings") {
                        settingsVisible = true
                    }
                    .background(.white)
                    .foregroundColor(.teal)
                    .fontWeight(.bold)
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
