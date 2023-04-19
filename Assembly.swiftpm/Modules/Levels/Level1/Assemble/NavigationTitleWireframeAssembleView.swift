//
//  NavigationTitleWireframeAssembleView.swift
//  
//
//  Created by Bryan on 19/04/23.
//

import SwiftUI

struct NavigationTitleWireframeAssembleView: View {
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
      NavigationTitleWireframeView() { componentType in
        onPlacedTap(componentType)
      }
    } else {
      RoundedRectangle(cornerRadius: RoundedShape.small)
        .contentShape(RoundedRectangle(cornerRadius: RoundedShape.small))
        .foregroundColor(.white.opacity(0))
        .overlay {
          RoundedRectangle(cornerRadius: RoundedShape.small)
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
            .foregroundColor(.blue)
        }
        .frame(maxWidth: 250, maxHeight: 20)
        .onTapGesture {
          onPlaceholderTap(.navigationTitle)
        }
    }
  }
}

struct NavigationTitleWireframeAssembleView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationTitleWireframeAssembleView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
