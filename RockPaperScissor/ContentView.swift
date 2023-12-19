//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by Filippo on 18/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var winOrLose : Bool = Bool.random()
    private var agents = ["rock", "paper", "scissor"]
    @State private var iPhoneChoise = Int.random(in: 0 ... 2)
    @State private var score : Int = 0
    @State private var questions : Int = 1
    @State private var isPresented : Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("You need to")
                Text("\(winOrLose ? "WIN" : "LOSE")")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(winOrLose ? .green : .red)
                Image(agents[iPhoneChoise])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            
            Spacer()
            Text("Choose your fighter")
            HStack{
                ForEach(agents, id: \.self){ agent in
                    Button(){
                        aFighterWasTapped(agent: agent)
                    } label: {
                        Image("\(agent)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
            }
            
        }.alert(isPresented: $isPresented){
            Alert(
                title: Text("You finish the game"),
                message: Text("Your score is: \(score)"),
                primaryButton: .default(Text("Restart"), action: restart), 
                secondaryButton: .destructive(Text("Close"), action: restart)
            )
        }
        .padding()
    }
    
    
    func restart () {
        questions = 1
        score = 0
        iPhoneChoise = Int.random(in: 0...2)
        winOrLose = Bool.random()
        isPresented = false
    }
    
    func aFighterWasTapped (agent: String){
        if questions == 10 {
            isPresented  = true
        }
        var correctAnswer : String
        switch winOrLose {
        case true:
            switch iPhoneChoise {
            case 0:
                correctAnswer = "paper"
                break;
            case 1:
                correctAnswer = "scissor"
                break;
            case 2:
                correctAnswer = "rock"
                break;
            default:
                correctAnswer = "even"
            }
        default:
            switch iPhoneChoise {
            case 0:
                correctAnswer = "scissor"
                break;
            case 1:
                correctAnswer = "rock"
                break;
            case 2:
                correctAnswer = "paper"
                break;
            default:
                correctAnswer = "even"
            }
        }
        winOrLose = Bool.random()
        iPhoneChoise = Int.random(in: 0 ... 2)
        if(correctAnswer == agent){
            score += 1
        } else {
            if(score > 0){
                score -= 1
            }
           
        }
        questions += 1
    }
}

#Preview {
    ContentView()
}
