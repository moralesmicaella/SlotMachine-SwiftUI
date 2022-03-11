//
//  FormRowView.swift
//  Slot Machine
//
//  Created by Micaella Morales on 3/10/22.
//

import SwiftUI

struct FormRowView: View {
  var firstItem: String
  var secondItem: String
  
  var body: some View {
    HStack {
      Text(firstItem)
        .foregroundColor(.gray)
      Spacer()
      Text(secondItem)
    }
  }
}
