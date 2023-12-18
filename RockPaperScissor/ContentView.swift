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
                        
                    } label: {
                        Image("\(agent)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
