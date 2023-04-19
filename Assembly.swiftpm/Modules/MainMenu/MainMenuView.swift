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
      VStack {
        Text("Assembly")
        NavigationLink {
          Level1View()
        } label: {
          Text("Start")
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
