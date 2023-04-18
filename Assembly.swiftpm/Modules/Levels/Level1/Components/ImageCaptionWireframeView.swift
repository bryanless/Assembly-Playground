//
//  ImageCaptionWireframeView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct ImageCaptionWireframeView: View {
  var onTap: () -> Void

  init(onTap: @escaping () -> Void) {
    self.onTap = onTap
  }

  var body: some View {
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
    .onTapGesture(perform: onTap)
  }
}

struct ImageCaptionWireframeView_Previews: PreviewProvider {
  static var previews: some View {
    ImageCaptionWireframeView {
      print("Image caption tapped")
    }
  }
}
