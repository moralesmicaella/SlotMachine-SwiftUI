//
//  Extension.swift
//  Slot Machine
//
//  Created by Micaella Morales on 3/10/22.
//

import SwiftUI

extension Text {
  func scoreLabelStyle() -> Text {
    self
      .foregroundColor(.white)
      .font(.system(size: 10, weight: .bold, design: .rounded))
  }
  
  func scoreNumberStyle() -> Text {
    self
      .foregroundColor(.white)
      .font(.system(.title, design: .rounded))
      .fontWeight(.heavy)
  }
}
