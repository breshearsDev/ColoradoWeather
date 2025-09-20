//
//  ContentView.swift
//  ColoradoWeather
//
//  Created by Breshears, Rob - CTC on 9/19/25.
//
// Codealong Steps:
// 1. Start with the VStack to create static home screen
// 2. Add var buttonPressed and add .toggle to button
// 3. Create a sheet that is presented on buttonPressed.  Add simple text to show how a sheet works.
//4. Add var temp and explaing Int.random.  Add code to show temp on sheet
//5.  Make a var message and set to an empty string.  It will be used to add message that coresponds to temperature
//6. Code the makeMessage function.  Try to explain the purpose of a function and the conditionals
//7. call makeMessage in ButtonAction.  Also print temp to console.
//8.  Add .onAppear modifier to VStack and print temp.  Demo print statement showing on re-render
//9. Add message to the sheet

import SwiftUI

struct ContentView: View {
    
    @State private var buttonPressed: Bool = false
    @State private var temp: Int = Int.random(in: -20...103)
    @State private var message: String = ""
    
    
    var body: some View {
        VStack {
            Image(systemName: "cloud.rain")
                .font(.system(size: 100))
                .foregroundStyle(.white)
                .fontWeight(.black)
            
            Text("Colorado Weather")
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Button("Get Weather") {
                temp = Int.random(in: -20...103)
                buttonPressed.toggle()
                makeMessage()
                print(temp)
            }
            .padding()
            .background(Color.orange)
            .cornerRadius(5)
            .foregroundStyle(.white)
            .fontWeight(.heavy)
        }
        .onAppear {
            makeMessage()
            print(temp)
            print(message)
        }
        .sheet(isPresented: $buttonPressed, content: {
            VStack {
                Text("\(temp)")
                    .font(.system(size: 200, design: .rounded))
                Text("\($message.wrappedValue)")
                    .font(.largeTitle)
            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.white, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        
    }
    
    
    func makeMessage()  {
        if temp > 90 {
            message = "Wow!  It is Hot!!!"
        } else if temp > 60 {
            message = "It's beautiful!"
        } else if temp > 32 {
            message = "It is brisk!"
        } else if temp > 0 {
            message = "Brr! Bundle up!"
        } else {
            message = "You should consider moving"
        }
    }
}

#Preview {
    ContentView()
}
