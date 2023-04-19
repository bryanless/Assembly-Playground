//
//  FigureWireframeAssembleView.swift
//  
//
//  Created by Bryan on 20/04/23.
//

import SwiftUI

struct FigureWireframeAssembleView: View {
  @Binding var isPlaced: Bool
  var onPlaceholderTap: (Level1ComponentEnum) -> Void
  var onPlacedTap: (Level1ComponentEnum) -> Void

  init(
    isPlaced: Binding<Bool> = .constant(false),
    onPlaceholderTap: @escaping (Level1ComponentEnum) -> Void = { _ in },
    onPlacedTap: @escaping (Level1ComponentEnum) -> Void = { _ in }) {
      _isPlaced = isPlaced
      self.onPlaceholderTap = onPlaceholderTap
      self.onPlacedTap = onPlacedTap
    }
  
  var body: some View {
    if isPlaced {
      FigureWireframeView() { componentType in
        onPlacedTap(componentType)
      }
    } else {
      VStack(alignment: .leading) {
        ImageWireframeAssembleView()
          .simultaneousGesture(tapGesture)
        ImageCaptionWireframeAssembleView()
          .simultaneousGesture(tapGesture)
      }
      .gesture(tapGesture)
    }
  }
}

extension FigureWireframeAssembleView {
  var tapGesture: some Gesture {
    TapGesture()
      .onEnded {
        onPlaceholderTap(.figure)
      }
  }
}

struct FigureWireframeAssembleView_Previews: PreviewProvider {
  static var previews: some View {
    FigureWireframeAssembleView()
  }
}
