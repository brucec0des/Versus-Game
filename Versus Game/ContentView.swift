//
//  ContentView.swift
//  Versus Game
//
//  Created by Bruce Elliott on 3/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var avengersCard = "avengersCardBack"
    @State var xmenCard = "xmenCardBack"
    @State var mainButton = "button1"
    @State var avengersScore = 0
    @State var xmenScore = 0
    @State var isActive = false
    
    var body: some View {
        
        ZStack {
            Image("background3")
                //.ignoresSafeArea()

            VStack {
                Spacer()
                Image("logo2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                HStack {
                    Spacer()
                    //Image("avengersCardBack")
                    Button(action: {avengerWins()}, label: {
                        Image(String(avengersCard))
                    })
                    Spacer()
                    //Image("xmenCardBack")
                    Button(action: {xmenWins()}, label: {
                        Image(xmenCard)
                    })
                    Spacer()
                }
                Spacer()
                //Image("button1")
                Button(action: {startEndGame()}, label: {
                    Image(String(mainButton))
                })
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Avengers")
                            .padding(.bottom)
                        Text(String(avengersScore))
                            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                    VStack {
                        Text("X-Men")
                            .padding(.bottom)
                        Text(String(xmenScore))
                            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                }
                .padding(.bottom, 10.0)
                .foregroundColor(.white)
                .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Image("vs2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .padding(.bottom, 60)
        }
        
        
    }
    
    func startEndGame() {
        //If game not in session, start game/flip cards over
        if !isActive {
            //Flip both cards at random
            let a = Int.random(in: 1...15)
            let x = Int.random(in: 1...15)
            avengersCard = "avengersCard" + String(a)
            xmenCard = "xmenCard" + String(x)
            //Switch to reset button
            mainButton = "button2"
            isActive = true
        } else {
            //If game is in session, reset everything
            //Flip cards back over
            avengersCard = "avengersCardBack"
            xmenCard = "xmenCardBack"
            //Switch back to Start button
            mainButton = "button1"
            //Reset both scores to 0
            avengersScore = 0
            xmenScore = 0
            isActive = false
        }
    }
    
    func avengerWins() {
        //Only allow this function if game has been started
        if isActive {
            //Add point to Avengers score
            avengersScore += 1
            //Switch to new opponent
            let x = Int.random(in: 1...15)
            xmenCard = "xmenCard" + String(x)
        }
    }
    
    func xmenWins() {
        //Only allow this function if game has been started
        if isActive {
            //Add point to X-Men's score
            xmenScore += 1
            //Switch to new opponent
            let a = Int.random(in: 1...15)
            avengersCard = "avengersCard" + String(a)
        }
    }
}

#Preview {
    ContentView()
}
