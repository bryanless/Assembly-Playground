//
//  ImageCaptionWireframeAssembleView.swift
//  
//
//  Created by Bryan on 19/04/23.
//

import SwiftUI

struct ImageCaptionWireframeAssembleView: View {
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
     ImageCaptionWireframeView()
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
             .stroke(style: StrokeStyle(lineWidth: 1, dash: [8]))
             .foregroundColor(.blue)
             .frame(maxWidth: 100, maxHeight: 12)
           RoundedRectangle(cornerRadius: RoundedShape.extraSmall)
             .stroke(style: StrokeStyle(lineWidth: 1, dash: [8]))
             .foregroundColor(.blue)
             .frame(maxWidth: 60, maxHeight: 12)
         }
         Spacer()
       }
     }
     .onTapGesture {
       onTap(.imageCaption)
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
