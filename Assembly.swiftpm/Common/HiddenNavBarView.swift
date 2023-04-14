//
//  HiddenNavBarView.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

struct HiddenNavBarView<Content: View>: View {
  let content: () -> Content

  init(@ViewBuilder content: @escaping () -> Content) {
    self.content = content
  }

  var body: some View {
    ZStack {
      content()
    }
    .toolbar(.hidden, for: .navigationBar)
  }
}

struct HiddenNavBarView_Previews: PreviewProvider {
  static var previews: some View {
    HiddenNavBarView {
      Text("Hola")
    }
  }
}
