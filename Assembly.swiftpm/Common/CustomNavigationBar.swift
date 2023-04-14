//
//  CustomNavigationBar.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

struct CustomNavigationBar: View {
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    HStack {
      Button {
        dismiss()
      } label: {
        Image(systemName: "arrowshape.left.fill")
          .imageScale(.large)
      }
      Spacer()
    }
  }
}

struct CustomNavigationBar_Previews: PreviewProvider {
  static var previews: some View {
    CustomNavigationBar()
  }
}
