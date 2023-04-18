//
//  ProfilePictureWireframeView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct ProfilePictureWireframeView: View {
  @Binding var isHidden: Bool
  var onTap: (Level1ComponentEnum) -> Void

  init(
    isHidden: Binding<Bool> = .constant(false),
    onTap: @escaping (Level1ComponentEnum) -> Void = { _ in }) {
      _isHidden = isHidden
      self.onTap = onTap
    }

  var body: some View {
    Circle()
      .frame(maxWidth: 40)
      .opacity(isHidden ? 0 : 1)
      .onTapGesture {
        onTap(.profilePicture)
      }
  }
}

struct ProfilePictureWireframeView_Previews: PreviewProvider {
  static var previews: some View {
    ProfilePictureWireframeView(isHidden: .constant(false)) { _ in
      print("Profile picture tapped")
    }
  }
}
