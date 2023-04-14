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
      VStack {
        Text("Level selection")
        PlainNavigationButton {
          Level1View()
        } label: {
          Text("Level 1")
        }
        .frame(width: 100, height: 100)
        .background(.red)
      }
    }
  }
}

struct LevelSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    LevelSelectionView()
  }
}
