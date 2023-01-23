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
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .mint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Text("Rock, Paper, Scissors")
                    .font(.largeTitle.bold())
                
                VStack(spacing: 15) {
                    Text("Computer picks")
                        .font(.title)
                    Text(move[selectedMove].uppercased())
                        .font(.system(size: 100))
                    Text("and want you to")
                        .font(.title)
                    Text(shouldWin ? "WIN" : "LOSE")
                        .font(.title.bold())
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(.regularMaterial)
                
                HStack {
                    ForEach(0..<3) { number in
                        Button(move[number]) {
                            if determineResult(move: move[selectedMove], shouldWin: shouldWin, choice: move[number]) {
                                score += 1
                            }
                            print("Score: \(score)")
                        }
                        .buttonStyle(.bordered)
                        .font(.system(size: 50))
                    }
                }
            }
            .padding()
        }
    }
    
    func determineResult(move: String, shouldWin: Bool, choice: String) -> Bool {
        switch move {
        case "rock":
            if shouldWin && choice == "paper" {
                return true
            } else if !shouldWin && choice == "scissors" {
                return true
            } else {
                return false
            }
        case "paper":
            if shouldWin && choice == "scissors" {
                return true
            } else if !shouldWin && choice == "rock" {
                return true
            } else {
                return false
            }
        case "scissors":
            if shouldWin && choice == "rock" {
                return true
            } else if !shouldWin && choice == "paper" {
                return true
            } else {
                return false
            }
        default:
            return false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
