//
//  LogoView.swift
//  Slot Machine
//
//  Created by Micaella Morales on 3/10/22.
//

import SwiftUI

struct LogoView: View {
  var body: some View {
    Image(slotMachine)
      .resizable()
      .scaledToFit()
      .frame(minWidth: 256, idealWidth: 300, maxWidth: 320, minHeight: 112, idealHeight: 130, maxHeight: 140, alignment: .center)
      .padding()
      .layoutPriority(1)
      .modifier(ShadowModifier())
  }
}

struct LogoView_Previews: PreviewProvider {
  static var previews: some View {
    LogoView()
      .previewLayout(.sizeThatFits)
  }
}
