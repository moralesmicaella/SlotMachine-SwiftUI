//
//  ContentView.swift
//  Slot Machine
//
//  Created by Micaella Morales on 3/10/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTY
  @State private var showInfoView: Bool = false
  @State private var reels: [Int] = [0, 1, 2]
  @State private var highScore: Int = 0
  @State private var coins: Int = 100
  @State private var betAmount: Int = 10
  
  private let symbols: [String] = [K.bell, K.cherry, K.coin, K.grape, K.seven, K.strawberry]
  
  // MARK: - FUNCTION
  func spinReels() {
    reels = reels.map { _ in
      Int.random(in: 0..<symbols.count)
    }
  }
  
  func checkSpinResult() {
    if reels[0] == reels[1] && reels[1] == reels[2] {
      playerWins()
      
      if coins > highScore {
        setNewHighScore()
      }
    } else {
      playerLoses()
    }
  }
  
  func playerWins() {
    coins += betAmount * 10
  }
  
  func setNewHighScore() {
    highScore = coins
  }
  
  func playerLoses() {
    coins -= betAmount
  }
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      // MARK: - BACKGROUND
      LinearGradient(colors: [K.colorPink, K.colorPurple], startPoint: .top, endPoint: .bottom)
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
            
            Text("\(coins)")
              .scoreNumberStyle()
              .modifier(ScoreNumberModifier())
          }
          .modifier(ScoreContainerModifier())
          
          Spacer()
          
          HStack {
            Text("\(highScore)")
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
            
            Image(symbols[reels[0]])
              .resizable()
              .modifier(ImageModifier())
          }
          
          HStack(alignment: .center, spacing: 0) {
            // MARK: - REEL #2
            ZStack {
              ReelView()
              
              Image(symbols[reels[1]])
                .resizable()
                .modifier(ImageModifier())
            }
            
            Spacer()
            
            // MARK: - REEL #3
            ZStack {
              ReelView()
              
              Image(symbols[reels[2]])
                .resizable()
                .modifier(ImageModifier())
            }
          }
          .frame(maxWidth: 500)
          
          // MARK: - SPIN BUTTON
          Button {
            spinReels()
            checkSpinResult()
          } label: {
            Image(K.spin)
              .renderingMode(.original)
              .resizable()
              .modifier(ImageModifier())
          }
          .buttonStyle(.plain)
          
        }
        .layoutPriority(2)
        
        // MARK: - FOOTER
        Spacer()
        
        HStack {
          // MARK: - BET 20
          HStack(alignment: .center, spacing: 10) {
            Button {
              print("Bet 20 coins")
            } label: {
              Text("20")
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .modifier(BetNumberModifier())
            }
            .modifier(BetCapsuleModifier())
            
            Image(K.chips)
              .resizable()
              .opacity(0)
              .modifier(CasinoChipsModifier())
          }
          
          // MARK: - BET 10
          HStack(alignment: .center, spacing: 10) {
            Image(K.chips)
              .resizable()
              .opacity(1)
              .modifier(CasinoChipsModifier())

            Button {
              print("Bet 10 coins")
            } label: {
              Text("10")
                .fontWeight(.heavy)
                .foregroundColor(K.colorYellow)
                .modifier(BetNumberModifier())
            }
            .modifier(BetCapsuleModifier())
          }
        }
        
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
          showInfoView = true
        } label: {
          Image(systemName: "info.circle")
        }
        .modifier(ButtonModifier())
      })
      .padding()
      .frame(maxWidth: 720)
      
      // MARK: - POPUP
    }
    .sheet(isPresented: $showInfoView) {
      InfoView()
    }
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
