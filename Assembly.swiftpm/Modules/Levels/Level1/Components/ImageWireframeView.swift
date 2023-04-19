//
//  ImageWireframeView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct ImageWireframeView: View {
  @Binding var isHidden: Bool
  var onTap: (Level1ComponentEnum) -> Void

  init(
    isHidden: Binding<Bool> = .constant(false),
    onTap: @escaping (Level1ComponentEnum) -> Void = { _ in }) {
      _isHidden = isHidden
      self.onTap = onTap
    }

  var body: some View {
    RoundedRectangle(cornerRadius: RoundedShape.small)
      .aspectRatio(4/3, contentMode: .fit)
      .foregroundColor(Color("ColorImagePlaceholder"))
      .opacity(isHidden ? 0 : 1)
      .onTapGesture {
        onTap(.image)
      }
  }
}

struct ImageWireframeView_Previews: PreviewProvider {
  static var previews: some View {
    ImageWireframeView(isHidden: .constant(false)) { _ in
      print("Image tapped")
    }
  }
}
