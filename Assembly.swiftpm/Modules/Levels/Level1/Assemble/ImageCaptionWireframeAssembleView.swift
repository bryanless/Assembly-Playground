//
//  ImageCaptionWireframeAssembleView.swift
//  
//
//  Created by Bryan on 19/04/23.
//

import SwiftUI

struct ImageCaptionWireframeAssembleView: View {
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
      ImageCaptionWireframeView() { componentType in
        onPlacedTap(componentType)
      }
    } else {
      HStack {
        VStack(alignment: .leading, spacing: Space.extraSmall) {
          RoundedRectangle(cornerRadius: RoundedShape.extraSmall)
            .frame(maxWidth: 100, maxHeight: 12)
          RoundedRectangle(cornerRadius: RoundedShape.extraSmall)
            .frame(maxWidth: 60, maxHeight: 12)
        }
        Spacer()
      }
      .contentShape(Rectangle())
      .foregroundColor(.white.opacity(0))
      .overlay {
        HStack {
          VStack(alignment: .leading, spacing: Space.extraSmall) {
            RoundedRectangle(cornerRadius: RoundedShape.extraSmall)
              .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
              .foregroundColor(.blue)
              .frame(maxWidth: 100, maxHeight: 12)
            RoundedRectangle(cornerRadius: RoundedShape.extraSmall)
              .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
              .foregroundColor(.blue)
              .frame(maxWidth: 60, maxHeight: 12)
          }
          Spacer()
        }
      }
      .onTapGesture {
        onPlaceholderTap(.imageCaption)
      }
    }
  }
}

struct ImageCaptionWireframeAssembleView_Previews: PreviewProvider {
  static var previews: some View {
    ImageCaptionWireframeAssembleView()
    .previewInterfaceOrientation(.landscapeLeft)
  }
}
