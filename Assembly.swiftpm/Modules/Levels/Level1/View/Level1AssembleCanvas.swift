//
//  Level1AssembleCanvas.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

struct Level1AssembleCanvas: View {
  @Binding var selectedDockIndex: Int
  @State var isNavigationTitleHidden: Bool
  @State var isProfilePictureHidden: Bool
  @State var isImageHidden: [Bool]
  @State var isImageCaptionHidden: [Bool]
  var onComponentTap: (Level1ComponentEnum) -> Void

  init(
    selectedDockIndex: Binding<Int>,
    isNavigationTitleHidden: Bool = false,
    isProfilePictureHidden: Bool = false,
    isImageHidden: [Bool] = Array(repeating: false, count: 6),
    isImageCaptionHidden: [Bool] = Array(repeating: false, count: 6),
    onComponentTap: @escaping (Level1ComponentEnum) -> Void) {
      _selectedDockIndex = selectedDockIndex
      self.isNavigationTitleHidden = isNavigationTitleHidden
      self.isProfilePictureHidden = isProfilePictureHidden
      self.isImageHidden = isImageHidden
      self.isImageCaptionHidden = isImageCaptionHidden
      self.onComponentTap = onComponentTap
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
  }
}

extension Level1AssembleCanvas {
  var navigationBar: some View {
    HStack {
      NavigationTitleWireframeAssembleView(isHidden: $isNavigationTitleHidden) { componentType in
        if selectedDockIndex == 0 {
          withAnimation {
            isNavigationTitleHidden.toggle()
          }
          onComponentTap(componentType)
        }
      }
      Spacer(minLength: Space.extraLarge)
      ProfilePictureWireframeAssembleView(isHidden: $isProfilePictureHidden) { componentType in
        if selectedDockIndex == 1 {
          withAnimation {
            isProfilePictureHidden.toggle()
          }
          onComponentTap(componentType)
        }
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
      ImageWireframeAssembleView(isHidden: $isImageHidden[index]) { componentType in
        if selectedDockIndex == 2 {
          withAnimation {
            isImageHidden[index].toggle()
          }
          onComponentTap(componentType)
        }
      }

      ImageCaptionWireframeAssembleView(isHidden: $isImageCaptionHidden[index]) { componentType in
        if selectedDockIndex == 3 {
          withAnimation {
            isImageCaptionHidden[index].toggle()
          }
          onComponentTap(componentType)
        }
      }
    }
  }
}

struct Level1AssembleCanvas_Previews: PreviewProvider {
  static var previews: some View {
    Level1AssembleCanvas(selectedDockIndex: .constant(0)) { _ in

    }
    .previewInterfaceOrientation(.landscapeLeft)
  }
}
