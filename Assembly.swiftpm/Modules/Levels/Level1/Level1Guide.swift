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
      NavigationTitleWireframeView {
        print("title tapped")
      }
      Spacer(minLength: Space.extraLarge)
      ProfilePictureWireframeView {
        print("picture tapped")
      }
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
      ImageWireframeView {
        print("Image tapped")
      }

      ImageCaptionWireframeView {
        print("Caption tapped")
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
