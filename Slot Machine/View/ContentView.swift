//
//  ContentView.swift
//  Slot Machine
//
//  Created by Micaella Morales on 3/10/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTY
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      // MARK: - BACKGROUND
      LinearGradient(colors: [colorPink, colorPurple], startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()
      
      // MARK: - INTERFACE
      VStack(alignment: .center, spacing: 5) {
        
        // MARK: - HEADER
        LogoView()
        
        Spacer()
        
        // MARK: - SCORE
        HStack {
          HStack {
            Text("Your\nCoins".uppercased())
              .scoreLabelStyle()
              .multilineTextAlignment(.trailing)
            
            Text("100")
              .scoreNumberStyle()
              .modifier(ScoreNumberModifier())
          }
          .modifier(ScoreContainerModifier())
          
          Spacer()
          
          HStack {
            Text("200")
              .scoreNumberStyle()
              .modifier(ScoreNumberModifier())
            
            Text("High\nScore".uppercased())
              .scoreLabelStyle()
              .multilineTextAlignment(.leading)
            
          }
          .modifier(ScoreContainerModifier())
        }
        
        // MARK: - SLOT MACHINE
        VStack(alignment: .center, spacing: 0) {
          // MARK: - REEL #1
          ZStack {
            ReelView()
            
            Image(bell)
              .resizable()
              .modifier(ImageModifier())
          }
          
          HStack(alignment: .center, spacing: 0) {
            // MARK: - REEL #2
            ZStack {
              ReelView()
              
              Image(seven)
                .resizable()
                .modifier(ImageModifier())
            }
            
            Spacer()
            
            // MARK: - REEL #3
            ZStack {
              ReelView()
              
              Image(cherry)
                .resizable()
                .modifier(ImageModifier())
            }
          }
          .frame(maxWidth: 500)
          
          // MARK: - SPIN BUTTON
          Button {
            print("Spin the reels")
          } label: {
            Image(spin)
              .renderingMode(.original)
              .resizable()
              .modifier(ImageModifier())
          }

        }
        .layoutPriority(2)
        
        // MARK: - FOOTER
        
        Spacer()
        
      }
      // MARK: - BUTTONS
      .overlay(alignment: .topLeading, content: {
        // RESET
        Button {
          print("Reset the game")
        } label: {
          Image(systemName: "arrow.2.circlepath.circle")
        }
        .modifier(ButtonModifier())
      })
      .overlay(alignment: .topTrailing, content: {
        // INFO
        Button {
          print("Info View")
        } label: {
          Image(systemName: "info.circle")
        }
        .modifier(ButtonModifier())
      })
      .padding()
      .frame(maxWidth: 720)
      
      // MARK: - POPUP
    }
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
