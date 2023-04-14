//
//  PlainNavigationButton.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

struct PlainNavigationButton<
  Label: View,
  Destination: View>: View {
  let destination: () -> Destination
  let label: () -> Label

  init(
    @ViewBuilder destination: @escaping () -> Destination,
    @ViewBuilder label: @escaping () -> Label) {
    self.destination = destination
    self.label = label
  }

  var body: some View {
    NavigationLink(
      destination: destination,
      label: label)
    .buttonStyle(.plain)
  }
}

struct PlainNavigationButton_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      PlainNavigationButton{
        Text("Destination page")
      } label: {
        Text("Navigation Button")
    }
    }
  }
}
