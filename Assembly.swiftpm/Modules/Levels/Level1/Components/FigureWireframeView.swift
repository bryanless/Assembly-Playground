//
//  FigureWireframeView.swift
//  
//
//  Created by Bryan on 20/04/23.
//

import SwiftUI

struct FigureWireframeView: View {
  @Binding var isHidden: Bool
  var onTap: (Level1ComponentEnum) -> Void

  init(
    isHidden: Binding<Bool> = .constant(false),
    onTap: @escaping (Level1ComponentEnum) -> Void = { _ in }) {
      _isHidden = isHidden
      self.onTap = onTap
  }

  var body: some View {
    VStack(alignment: .leading) {
      ImageWireframeView()
        .simultaneousGesture(tapGesture)
      ImageCaptionWireframeView()
        .simultaneousGesture(tapGesture)
    }
    .opacity(isHidden ? 0 : 1)
    .gesture(tapGesture)
  }
}

extension FigureWireframeView {
  var tapGesture: some Gesture {
    TapGesture()
      .onEnded {
        onTap(.figure)
      }
  }
}

struct FigureWireframeView_Previews: PreviewProvider {
  static var previews: some View {
    FigureWireframeView()
  }
}
