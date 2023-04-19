//
//  NavigationTitleWireframeAssembleView.swift
//  
//
//  Created by Bryan on 19/04/23.
//

import SwiftUI

struct NavigationTitleWireframeAssembleView: View {
  @Binding var isPlaced: Bool
  var onTap: (Level1ComponentEnum) -> Void

  init(
    isHidden: Binding<Bool> = .constant(false),
    onTap: @escaping (Level1ComponentEnum) -> Void = { _ in }) {
      _isPlaced = isHidden
      self.onTap = onTap
    }

  var body: some View {
    if isPlaced {
      NavigationTitleWireframeView()
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
          onTap(.navigationTitle)
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
