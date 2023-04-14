//
//  LevelSelectionView.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

struct LevelSelectionView: View {
  var body: some View {
    HiddenNavBarView {
      VStack(spacing: Space.extraLarge) {
        CustomNavigationBar()
        Spacer()
        content
        Spacer()
      }
    }
    .padding()
  }
}

extension LevelSelectionView {
  var content: some View {
    VStack(spacing: Space.large) {
      Text("Level selection")
      PlainNavigationButton {
        Level1View()
      } label: {
        Text("Level 1")
          .font(.headline)
          .frame(width: 100, height: 100)
          .padding(.vertical, 8)
          .foregroundColor(.white)
          .background(Color.blue)
          .cornerRadius(8)
      }
    }
  }
}

struct LevelSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    LevelSelectionView()
  }
}
