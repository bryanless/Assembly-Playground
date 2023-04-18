//
//  ProfilePictureWireframeView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct ProfilePictureWireframeView: View {
  var onTap: () -> Void

  init(onTap: @escaping () -> Void) {
    self.onTap = onTap
  }

  var body: some View {
    Circle()
      .frame(maxWidth: 40)
      .onTapGesture(perform: onTap)
  }
}

struct ProfilePictureWireframeView_Previews: PreviewProvider {
  static var previews: some View {
    ProfilePictureWireframeView {
      print("Profile picture tapped")
    }
  }
}
