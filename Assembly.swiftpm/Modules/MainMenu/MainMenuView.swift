//
//  MainMenuView.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

struct MainMenuView: View {
  var body: some View {
    HiddenNavBarView {
      VStack(spacing: 40) {
        Text("Assembly")
          .font(.custom("", size: 64))
          .bold()
        NavigationLink {
          Level1View()
        } label: {
          Text("Start")
            .padding(.vertical, Space.small)
            .padding(.horizontal, 48)
        }.buttonStyle(.borderedProminent)
      }
    }
  }
}

struct MainMenuView_Previews: PreviewProvider {
  static var previews: some View {
    MainMenuView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
