//
//  NavigationTitleWireframeView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct NavigationTitleWireframeView: View {
  @Binding var isHidden: Bool
  var onTap: (Level1ComponentEnum) -> Void

  init(
    isHidden: Binding<Bool> = .constant(false),
    onTap: @escaping (Level1ComponentEnum) -> Void = { _ in }) {
      _isHidden = isHidden
      self.onTap = onTap
    }

  var body: some View {
    RoundedRectangle(cornerRadius: RoundedShape.small)
      .frame(maxWidth: 250, maxHeight: 20)
      .opacity(isHidden ? 0 : 1)
      .onTapGesture {
        onTap(.navigationTitle)
      }
  }
}

struct NavigationTitleWireframeView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationTitleWireframeView(isHidden: .constant(false)) { _ in
      print("Navigation title tapped")
    }
  }
}
