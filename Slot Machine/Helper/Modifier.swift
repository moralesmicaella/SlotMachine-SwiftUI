//
//  Modifier.swift
//  Slot Machine
//
//  Created by Micaella Morales on 3/10/22.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .shadow(color: colorTransparentBlack, radius: 0, x: 0, y: 6)
  }
}

struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .buttonStyle(.plain)
      .font(.title)
      .foregroundColor(.white)
  }
}

struct ScoreNumberModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .shadow(color: colorTransparentBlack, radius: 0, x: 0, y: 3)
      .layoutPriority(1)
  }
}

struct ScoreContainerModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(.vertical, 4)
      .padding(.horizontal, 16)
      .frame(minWidth: 128)
      .background(
        Capsule()
          .foregroundColor(colorTransparentBlack)
      )
  }
}
