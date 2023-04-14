//
//  Level1Guide.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

struct Level1Guide: View {
  var body: some View {
    VStack(spacing: Space.large) {
      navigationBar
      content
    }
    .aspectRatio(9/16, contentMode: .fit)
    .padding()
    .background(.white)
    .cornerRadius(12)
    .padding()
    .background(.black)
    .cornerRadius(24)
  }
}

extension Level1Guide {
  var navigationBar: some View {
    HStack {
      RoundedRectangle(cornerRadius: RoundedShape.small)
        .frame(maxWidth: 250, maxHeight: 20)
      Spacer(minLength: Space.extraLarge)
      Circle()
        .frame(maxWidth: 40)
    }
  }

  var content: some View {
    VStack(spacing: Space.medium) {
      HStack(spacing: Space.medium) {
        gridItem
        gridItem
      }
      HStack(spacing: Space.medium) {
        gridItem
        gridItem
      }
      HStack(spacing: Space.medium) {
        gridItem
        gridItem
      }
    }
  }

  var gridItem: some View {
    VStack(alignment: .leading) {
      RoundedRectangle(cornerRadius: RoundedShape.small)
        .aspectRatio(4/3, contentMode: .fit)

      VStack(alignment: .leading, spacing: Space.extraSmall) {
        RoundedRectangle(cornerRadius: RoundedShape.extraSmall)
          .frame(maxWidth: 100, maxHeight: 12)
        RoundedRectangle(cornerRadius: RoundedShape.extraSmall)
          .frame(maxWidth: 60, maxHeight: 12)
      }
    }
  }
}

struct Level1Guide_Previews: PreviewProvider {
  static var previews: some View {
    Level1Guide()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
