//
//  NavigationTitleWireframeView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct NavigationTitleWireframeView: View {
  var onTap: () -> Void

  init(onTap: @escaping () -> Void) {
    self.onTap = onTap
  }

  var body: some View {
    RoundedRectangle(cornerRadius: RoundedShape.small)
      .frame(maxWidth: 250, maxHeight: 20)
      .onTapGesture(perform: onTap)
  }
}

struct SwiftUIView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationTitleWireframeView {
      print("Navigation title tapped")
    }
  }
}
