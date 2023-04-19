//
//  Level1MainCanvas.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct Level1MainCanvas: View {
  @State var isNavigationTitleHidden: Bool
  @State var isProfilePictureHidden: Bool
  @State var isImageHidden: [Bool]
  @State var isImageCaptionHidden: [Bool]
  var onComponentTap: (Level1ComponentEnum) -> Void
  var onCanvasTap: () -> Void

  init(
    isNavigationTitleHidden: Bool = false,
    isProfilePictureHidden: Bool = false,
    isImageHidden: [Bool] = Array(repeating: false, count: 6),
    isImageCaptionHidden: [Bool] = Array(repeating: false, count: 6),
    onComponentTap: @escaping (Level1ComponentEnum) -> Void,
    onCanvasTap: @escaping () -> Void) {
      self.isNavigationTitleHidden = isNavigationTitleHidden
      self.isProfilePictureHidden = isProfilePictureHidden
      self.isImageHidden = isImageHidden
      self.isImageCaptionHidden = isImageCaptionHidden
      self.onComponentTap = onComponentTap
      self.onCanvasTap = onCanvasTap
    }

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
    .gesture(tapGesture)
  }
}

extension Level1MainCanvas {
  var tapGesture: some Gesture {
    TapGesture()
      .onEnded {
        onCanvasTap()
      }
  }

  var navigationBar: some View {
    HStack {
      NavigationTitleWireframeView(isHidden: $isNavigationTitleHidden) { _ in
        print("title tapped")
        withAnimation {
          isNavigationTitleHidden.toggle()
        }
        onComponentTap(.navigationTitle)
      }
      Spacer(minLength: Space.extraLarge)
      ProfilePictureWireframeView(isHidden: $isProfilePictureHidden) { _ in
        print("picture tapped")
        withAnimation {
          isProfilePictureHidden.toggle()
        }
        onComponentTap(.profilePicture)
      }
    }
  }

  var content: some View {
    VStack(spacing: Space.medium) {
      HStack(spacing: Space.medium) {
        gridItem(index: 0)
        gridItem(index: 1)
      }
      HStack(spacing: Space.medium) {
        gridItem(index: 2)
        gridItem(index: 3)
      }
      HStack(spacing: Space.medium) {
        gridItem(index: 4)
        gridItem(index: 5)
      }
    }
  }

  func gridItem(index: Int) -> some View {
    VStack(alignment: .leading) {
      ImageWireframeView(isHidden: $isImageHidden[index]) { _ in
        print("Image tapped")
        withAnimation {
          isImageHidden[index].toggle()
        }
        onComponentTap(.image)
      }

      ImageCaptionWireframeView(isHidden: $isImageCaptionHidden[index]) { imageCaptionEnum in
        print("Caption tapped")
        withAnimation {
          isImageCaptionHidden[index].toggle()
        }
        onComponentTap(.imageCaption)
      }
    }
  }
}

struct Level1MainCanvas_Previews: PreviewProvider {
  static var previews: some View {
    Level1MainCanvas { componentType in
      print("Component tapped")
    } onCanvasTap: {
      print("Canvas tapped")
    }
    .previewInterfaceOrientation(.landscapeLeft)
  }
}

