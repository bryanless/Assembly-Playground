//
//  ImageWireframeAssembleView.swift
//  
//
//  Created by Bryan on 19/04/23.
//

import SwiftUI

struct ImageWireframeAssembleView: View {
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
     ImageWireframeView()
   } else {
     RoundedRectangle(cornerRadius: RoundedShape.small)
       .aspectRatio(4/3, contentMode: .fit)
       .contentShape(RoundedRectangle(cornerRadius: RoundedShape.small))
       .foregroundColor(.white.opacity(0))
       .overlay {
         RoundedRectangle(cornerRadius: RoundedShape.small)
           .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
           .foregroundColor(.blue)
       }
       .onTapGesture {
         onTap(.image)
       }
   }
  }
}

struct ImageWireframeAssembleView_Previews: PreviewProvider {
  static var previews: some View {
    ImageWireframeAssembleView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
