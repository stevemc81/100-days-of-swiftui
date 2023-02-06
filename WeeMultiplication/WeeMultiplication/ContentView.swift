//
//  ContentView.swift
//  WeeMultiplication
//
//  Created by Steven McWee on 03/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var startGame = false
    @State private var timesTable = 5
    @State private var selectedQuestionsIndex = 0
    var numberOfQuestions = [5, 10, 20]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.teal, .blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    if !startGame {
                        Section {
                            Text("Set up your game!")
                                .font(.title.bold())
                            
                            Text("Which multiplication table will we practice?")
                            
                            Picker("Times table", selection: $timesTable) {
                                ForEach(2..<13) {
                                    Text("\($0) times table")
                                }
                            }
                            .pickerStyle(.wheel)
                            
                            Text("How many questions would you like?")
                            
                            Picker("Questions", selection: $selectedQuestionsIndex) {
                                ForEach(0..<numberOfQuestions.count, id: \.self) {
                                    Text("\(numberOfQuestions[$0])")
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            
                            Button("Start game") {
                                withAnimation {
                                    startGame = true
                                }
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    
                    if startGame {
                        Section {
                            var actualTimesTable  = timesTable + 2
                            
                            Text("You chose the \(actualTimesTable) times table and \(numberOfQuestions[selectedQuestionsIndex]) questions.")
                            
                            Button("End game") {
                                withAnimation {
                                    startGame = false
                                }
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
            }
            .navigationTitle("Wee Multiplication")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
