//
//  InfoView.swift
//  Slot Machine
//
//  Created by Micaella Morales on 3/10/22.
//

import SwiftUI

struct InfoView: View {
  // MARK: - PROPERTY
  @Environment(\.presentationMode) var presentationMode
  
  // MARK: - BODY
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      LogoView()
      
      Spacer()
      
      Form {
        Section {
          FormRowView(firstItem: "Application", secondItem: "Slot Machine")
          FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
          FormRowView(firstItem: "Developer", secondItem: "John / Jane")
          FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
          FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
          FormRowView(firstItem: "Website", secondItem: "swiftuimasterclass.com")
          FormRowView(firstItem: "Copyright", secondItem: "© 2022 All right reserved")
          FormRowView(firstItem: "Version", secondItem: "1.0.0")
        } header: {
          Text("About the application")
        }
      }
      .font(.system(.body, design: .rounded))
    }
    .padding(.top, 20)
    .overlay(alignment: .topTrailing, content: {
      Button {
        presentationMode.wrappedValue.dismiss()
      } label: {
        Image(systemName: "xmark.circle")
          .font(.title)
          .foregroundColor(.secondary)
      }
      .buttonStyle(.plain)
      .padding(.top, 20)
      .padding(.trailing, 20)
    })
    .onAppear {
      playMP3(K.backgroundMusic)
    }
  }
}

// MARK: - PREVIEW
struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}

