//
//  ProfilePictureWireframeAssembleView.swift
//  
//
//  Created by Bryan on 19/04/23.
//

import SwiftUI

struct ProfilePictureWireframeAssembleView: View {
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
     ProfilePictureWireframeView() { componentType in
       onPlacedTap(componentType)
     }
   } else {
     Circle()
       .contentShape(Circle())
       .foregroundColor(.white.opacity(0))
       .overlay {
         Circle()
           .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
           .foregroundColor(.blue)
       }
       .frame(maxWidth: 40)
       .onTapGesture {
         onPlaceholderTap(.profilePicture)
       }
   }
  }
}

struct ProfilePictureWireframeAssembleView_Previews: PreviewProvider {
  static var previews: some View {
    ProfilePictureWireframeAssembleView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
