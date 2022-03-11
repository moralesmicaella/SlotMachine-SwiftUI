//
//  ContentView.swift
//  Slot Machine
//
//  Created by Micaella Morales on 3/10/22.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTY
  @AppStorage(K.highScore) private var highScore: Int = 0
  
  @State private var showInfoView: Bool = false
  @State private var showModalView: Bool = false
  @State private var isActiveBet10: Bool = true
  @State private var isActiveBet20: Bool = false
  @State private var isAnimatingSymbol: Bool = false
  @State private var isAnimatingModalView: Bool = false
  
  @State private var reels: [Int] = [0, 1, 2]
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
  
  func activateBet20() {
    betAmount = 20
    isActiveBet20 = true
    isActiveBet10 = false
  }
  
  func activateBet10() {
    betAmount = 10
    isActiveBet10 = true
    isActiveBet20 = false
  }
  
  func isGameOver() {
    if coins <= 0 {
      showModalView = true
    }
  }
  
  func restart() {
    showModalView = false
    isAnimatingModalView = false
    coins = 100
    activateBet10()
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
              .opacity(isAnimatingSymbol ? 1 : 0)
              .offset(y: isAnimatingSymbol ? 0 : -50)
              .animation(.easeOut(duration: Double.random(in: 0.5...0.7)), value: isAnimatingSymbol)
              .onAppear {
                isAnimatingSymbol = true
              }
          }
          
          HStack(alignment: .center, spacing: 0) {
            // MARK: - REEL #2
            ZStack {
              ReelView()
              
              Image(symbols[reels[1]])
                .resizable()
                .modifier(ImageModifier())
                .opacity(isAnimatingSymbol ? 1 : 0)
                .offset(y: isAnimatingSymbol ? 0 : -50)
                .animation(.easeOut(duration: Double.random(in: 0.7...0.9)), value: isAnimatingSymbol)
                .onAppear {
                  isAnimatingSymbol = true
                }
            }
            
            Spacer()
            
            // MARK: - REEL #3
            ZStack {
              ReelView()
              
              Image(symbols[reels[2]])
                .resizable()
                .modifier(ImageModifier())
                .opacity(isAnimatingSymbol ? 1 : 0)
                .offset(y: isAnimatingSymbol ? 0 : -50)
                .animation(.easeOut(duration: Double.random(in: 0.9...1.1)), value: isAnimatingSymbol)
                .onAppear {
                  isAnimatingSymbol = true
                }
            }
          }
          .frame(maxWidth: 500)
          
          // MARK: - SPIN BUTTON
          Button {
            // SET THE DEFAULT STATE: NO ANIMATION
            withAnimation {
              isAnimatingSymbol = false
            }
            
            spinReels()
            
            // TRIGGER ANIMATION
            withAnimation {
              isAnimatingSymbol = true
            }
            
            checkSpinResult()
            isGameOver()
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
              activateBet20()
            } label: {
              Text("20")
                .fontWeight(.heavy)
                .foregroundColor(isActiveBet20 ? K.colorYellow : .white)
                .modifier(BetNumberModifier())
            }
            .modifier(BetCapsuleModifier())
            
            Image(K.chips)
              .resizable()
              .opacity(isActiveBet20 ? 1 : 0)
              .offset(x: isActiveBet20 ? 0 : 20)
              .animation(.default, value: isActiveBet20)
              .modifier(CasinoChipsModifier())
          }
          
          Spacer()
          
          // MARK: - BET 10
          HStack(alignment: .center, spacing: 10) {
            Image(K.chips)
              .resizable()
              .opacity(isActiveBet10 ? 1 : 0)
              .offset(x: isActiveBet10 ? 0 : -20)
              .animation(.default, value: isActiveBet10)
              .modifier(CasinoChipsModifier())

            Button {
              activateBet10()
            } label: {
              Text("10")
                .fontWeight(.heavy)
                .foregroundColor(isActiveBet10 ? K.colorYellow : .white)
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
          restart()
          highScore = 0
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
      .blur(radius: showModalView ? 5 : 0)
      
      // MARK: - POPUP
      if showModalView {
        ZStack {
          K.colorTransparentBlack
            .ignoresSafeArea()
          
          // MODAL
          VStack(spacing: 0) {
            // TITLE
            Text("GAME OVER")
              .font(.system(.title, design: .rounded))
              .fontWeight(.heavy)
              .padding()
              .frame(minWidth: 0, maxWidth: .infinity)
              .background(K.colorPink)
              .foregroundColor(.white)
              
            Spacer()
            
            // MESSAGE
            VStack(alignment: .center, spacing: 16) {
              Image(K.sevenReel)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 72)
              
              Text("Bad luck! You lost all of the coins. \nLet's play again")
                .font(.system(.body, design: .rounded))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .layoutPriority(1)
              
              Button {
                restart()
              } label: {
                Text("NEW GAME")
                  .font(.system(.body, design: .rounded))
                  .fontWeight(.semibold)
                  .foregroundColor(K.colorPink)
                  .padding(.horizontal, 12)
                  .padding(.vertical, 8)
                  .frame(minWidth: 128)
                  .background(
                    Capsule()
                      .stroke(lineWidth: 1.75)
                      .foregroundColor(K.colorPink)
                  )
              }
              .buttonStyle(.plain)

            }
            
            Spacer()
          }
          .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
          .background(Color.white)
          .cornerRadius(20)
          .shadow(color: K.colorTransparentBlack, radius: 6, x: 0, y: 8)
          .opacity(isAnimatingModalView ? 1 : 0)
          .offset(y: isAnimatingModalView ? 0 : -100)
          .animation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0), value: isAnimatingModalView)
          .onAppear {
            isAnimatingModalView = true
          }
        }
      }
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
