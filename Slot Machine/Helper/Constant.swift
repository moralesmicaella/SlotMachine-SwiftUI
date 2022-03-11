//
//  Constant.swift
//  Slot Machine
//
//  Created by Micaella Morales on 3/10/22.
//

import SwiftUI

struct K {
  // COLORS
  static let colorPink: Color = Color("ColorPink")
  static let colorPurple: Color = Color("ColorPurple")
  static let colorYellow: Color = Color("ColorYellow")
  static let colorTransparentBlack: Color = Color("ColorTransparentBlack")
  
  // GRAPHICS
  static let bell: String = "gfx-bell"
  static let chips: String = "gfx-casino-chips"
  static let cherry: String = "gfx-cherry"
  static let coin: String =  "gfx-coin"
  static let grape: String = "gfx-grape"
  static let reel: String = "gfx-reel"
  static let sevenReel: String = "gfx-seven-reel"
  static let seven: String = "gfx-seven"
  static let slotMachine: String = "gfx-slot-machine"
  static let spin: String = "gfx-spin"
  static let strawberry: String = "gfx-strawberry"
  
  // SOUND
  static let backgroundMusic: String = "background-music"
  static let casinoChipsSound: String = "casino-chips"
  static let chimeUpSound: String = "chimeup"
  static let gameOverSound: String = "game-over"
  static let highScoreSound: String = "high-score"
  static let riseUpSound: String = "riseup"
  static let spinSound: String = "spin"
  static let winSound: String = "win"
  
  // UX
  static let haptics = UINotificationFeedbackGenerator()
  
  // USER DEFAULTS KEYS
  static let highScore: String = "HighScore"
}
