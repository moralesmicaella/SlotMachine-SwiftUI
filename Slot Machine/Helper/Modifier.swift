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
      .shadow(color: K.colorTransparentBlack, radius: 0, x: 0, y: 6)
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
      .shadow(color: K.colorTransparentBlack, radius: 0, x: 0, y: 3)
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
          .foregroundColor(K.colorTransparentBlack)
      )
  }
}

struct ImageModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .scaledToFit()
      .frame(minWidth: 140, idealWidth: 200, maxWidth: 220, minHeight: 130, idealHeight: 190, maxHeight: 200, alignment: .center)
      .modifier(ShadowModifier())
  }
}

struct BetNumberModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(.title, design: .rounded))
      .padding(.vertical, 5)
      .frame(width: 90)
      .shadow(color: K.colorTransparentBlack, radius: 0, x: 0, y: 3)
  }
}

struct BetCapsuleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .buttonStyle(.plain)
      .background(
        Capsule()
          .fill(LinearGradient(colors: [K.colorPink, K.colorPurple], startPoint: .top, endPoint: .bottom))
      )
      .padding(3)
      .background(
        Capsule()
          .fill(LinearGradient(colors: [K.colorPink, K.colorPurple], startPoint: .bottom, endPoint: .top))
          .modifier(ShadowModifier())
      )
  }
}

struct CasinoChipsModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .scaledToFit()
      .frame(height: 64)
      .modifier(ShadowModifier())
  }
}
