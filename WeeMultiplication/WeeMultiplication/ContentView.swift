//
//  ContentView.swift
//  WeeMultiplication
//
//  Created by Steven McWee on 03/02/2023.
//

import SwiftUI

struct Question {
    let question: String
    let answer: Int
}

struct ContentView: View {
    @State private var startGame = false
    
    @State private var timesTable = 5
    @State private var selectedQuestionsIndex = 0
    @State private var questions: [Question] = []
    @State private var maxQuestions = 0
    
    @State private var currentQuestion = 0
    @State private var score = 0
    @State private var response = 0
    
    @State private var showResult = false
    @State private var alertTitle = ""
    
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
                                    let actualTimesTable  = timesTable + 2
                                    generateQs(for: actualTimesTable)
                                    startGame = true
                                }
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    
                    if startGame {
                        Section {
                            Text("Your score: \(score)")
                                .font(.headline)
                            
                            HStack {
                                Text(questions[currentQuestion].question)
                                
                                TextField("Answer", value: $response, format: .number)
                                    .textFieldStyle(.roundedBorder)
                                
                                Button("Submit") {
                                    checkAnswer(userResponse: response)
                                }
                                .buttonStyle(.borderedProminent)
                            }
                            
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
//        .alert(alertTitle, isPresented: $showResult) {
//            Button("Continue", action: nextQuestion)
//        } message: {
//            Text("Your score is \(score)")
//        }
    }
    
    func generateQs(for timesTable: Int) {
        questions.removeAll()
        
        for _ in 1...numberOfQuestions[selectedQuestionsIndex] {
            let num = Int.random(in: 1...12)
            let q = "\(timesTable) x \(num) ="
            let a = timesTable * num
            let question: Question = Question(question: q, answer: a)
            questions.append(question)
        }
        
        maxQuestions = numberOfQuestions[selectedQuestionsIndex]
    }
    
    func checkAnswer(userResponse: Int) {
        if userResponse == questions[currentQuestion].answer {
            score += 1
        }
        
        if currentQuestion < maxQuestions {
            nextQuestion()
        } else {
            startGame = false
        }
    }
    
    func nextQuestion() {
        //if currentQuestion < numberOfQuestions[selectedQuestionsIndex] {
            print("currentQuestion: \(currentQuestion)")
            print("maxQuestion: \(maxQuestions)")
            currentQuestion += 1
            response = 0
//        } else {
//            startGame = false
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
