//
//  ProfilePictureWireframeAssembleView.swift
//  
//
//  Created by Bryan on 19/04/23.
//

import SwiftUI

struct ProfilePictureWireframeAssembleView: View {
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
     ProfilePictureWireframeView()
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
         onTap(.profilePicture)
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
