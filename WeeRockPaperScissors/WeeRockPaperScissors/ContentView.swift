//
//  ContentView.swift
//  WeeRockPaperScissors
//
//  Created by Steven McWee on 23/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var move = ["rock", "paper", "scissors"]
    @State private var selectedMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var turn = 0
    @State private var resultTitle = ""
    @State private var showResult = false
    @State private var gameOver = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .mint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle.bold())
                
                VStack(spacing: 15) {
                    Text("Turn \(turn + 1)")
                        .font(.body)
                    Text("Computer picks")
                        .font(.title)
                    Text(move[selectedMove].uppercased())
                        .font(.system(size: 50))
                    Text("and wants you to")
                        .font(.title)
                    Text(shouldWin ? "WIN" : "LOSE")
                        .font(.system(size: 50))
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(.regularMaterial)
                
                HStack {
                    ForEach(0..<3) { number in
                        Button(move[number]) {
                            determineResult(move: move[selectedMove], shouldWin: shouldWin, choice: move[number])
                        }
                        .buttonStyle(.bordered)
                        .font(.system(size: 30))
                    }
                }
            }
            .padding()
        }
        .alert(resultTitle, isPresented: $showResult) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Keep going!")
        }
        .alert("Game over", isPresented: $gameOver) {
            Button("Play again") {
                score = 0
                turn = 0
            }
        } message: {
            Text("You scored \(score) out of 10")
        }
    }
    
    func determineResult(move: String, shouldWin: Bool, choice: String) {
        switch move {
        case "rock":
            if shouldWin && choice == "paper" {
                score += 1
                resultTitle = "Correct!"
            } else if !shouldWin && choice == "scissors" {
                score += 1
                resultTitle = "Correct!"
            } else {
                resultTitle = "Wrong!"
            }
        case "paper":
            if shouldWin && choice == "scissors" {
                score += 1
                resultTitle = "Correct!"
            } else if !shouldWin && choice == "rock" {
                score += 1
                resultTitle = "Correct!"
            } else {
                resultTitle = "Wrong!"
            }
        case "scissors":
            if shouldWin && choice == "rock" {
                score += 1
                resultTitle = "Correct!"
            } else if !shouldWin && choice == "paper" {
                score += 1
                resultTitle = "Correct!"
            } else {
                resultTitle = "Wrong!"
            }
        default:
            resultTitle = "Wrong!"
        }
        
        showResult = true
    }
    
    func askQuestion() {
        if turn < 9 {
            selectedMove = Int.random(in: 0...2)
            shouldWin = Bool.random()
            turn += 1
        } else {
            gameOver = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
