//
//  ImageWireframeView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct ImageWireframeView: View {
  var onTap: () -> Void

  init(onTap: @escaping () -> Void) {
    self.onTap = onTap
  }

  var body: some View {
    RoundedRectangle(cornerRadius: RoundedShape.small)
      .aspectRatio(4/3, contentMode: .fit)
      .onTapGesture(perform: onTap)
  }
}

struct ImageWireframeView_Previews: PreviewProvider {
  static var previews: some View {
    ImageWireframeView {
      print("Image tapped")
    }
  }
}
