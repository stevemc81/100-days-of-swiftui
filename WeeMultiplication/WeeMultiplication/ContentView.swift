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
    @State private var showingSettings = true           // Is settings screen shown?
    @State private var multiplicationTable = 5          // Default value for times table
    @State private var numberOfQuestionsIndex = 0       // Default value for number of questions to ask
    @State private var questions: [Question] = []       // Array of questions
    @State private var isGameOver = false               // Is the game over?
    @State private var gameOverMessage = ""             // Message to show at end of game
    @State private var score = 0                        // Player's score
    @State private var questionNumber = 0               // Which question the player is on
    @State private var userAnswer = ""                  // Player's current answer as a string
    
    var numberOfQuestions = [5, 10, 20]                 // Array of number of questions options
    
    var body: some View {
        if showingSettings {
                VStack(spacing: 10) {
                    Group {
                        Spacer()
                        
                        Text("Settings")
                            .font(.largeTitle.bold())
                    }
                    
                    Group {
                        Spacer()
                        
                        Text("Choose times table")
                            .font(.title2.bold())
                        
                        Stepper("Practice my \(multiplicationTable) times table", value: $multiplicationTable, in: 2...12)
                    }

                    Group {
                        Spacer()
                        
                        Text("Choose number of questions")
                            .font(.title2.bold())
                        
                        Picker(selection: $numberOfQuestionsIndex, label: Text("Number of questions")) {
                            ForEach(0..<numberOfQuestions.count, id: \.self) {
                                Text("\(numberOfQuestions[$0])")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Group {
                        Spacer()
                
                        Button("Start game") {
                            generateQuestions()
                            showingSettings = false
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Spacer()
                    }
                }
                .padding()
        } else {
            VStack(spacing: 10) {
                Text("Score: \(score)")
                    .font(.largeTitle.bold())
                
                Spacer()
                
                Text("\(questions[questionNumber].question)")
                
                TextField("Answer?", text: $userAnswer)
                
                Button("Check!") {
                    checkAnswer(response: Int(userAnswer) ?? 0, answer: questions[questionNumber].answer)
                }
                
                Spacer()
            }
            .padding()
            .alert("Game over", isPresented: $isGameOver) {
                Button("Play again") {
                    showingSettings = true
                    userAnswer = ""
                    score = 0
                    gameOverMessage = ""
                    questionNumber = 0
                }
            } message: {
                Text(gameOverMessage)
            }
        }
    }
    
    func generateQuestions() {
        questions.removeAll()
        
        for _ in 1...numberOfQuestions[numberOfQuestionsIndex] {
            let number = Int.random(in: 1...12)
            let question = Question(question: "\(multiplicationTable) x \(number) =", answer: multiplicationTable * number)
            questions.append(question)
        }
    }
    
    func checkAnswer(response: Int, answer: Int) {
        if response == answer {
            score += 1
        }
        userAnswer = ""
        
        if questionNumber < numberOfQuestions[numberOfQuestionsIndex] - 1 {
            questionNumber += 1
        } else {
            gameOverMessage = "Your score is \(score)"
            isGameOver = true
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
