//
//  ImageCaptionWireframeView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct ImageCaptionWireframeView: View {
  @Binding var isHidden: Bool
  var onTap: (Level1ComponentEnum) -> Void

  init(isHidden: Binding<Bool> = .constant(false), onTap: @escaping (Level1ComponentEnum) -> Void = { _ in }) {
    _isHidden = isHidden
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
    .opacity(isHidden ? 0 : 1)
    .onTapGesture {
      onTap(.imageCaption)
    }
  }
}

struct ImageCaptionWireframeView_Previews: PreviewProvider {
  static var previews: some View {
    ImageCaptionWireframeView(isHidden: .constant(false)) { componentEnum in
      print("Image caption tapped")
    }
  }
}
