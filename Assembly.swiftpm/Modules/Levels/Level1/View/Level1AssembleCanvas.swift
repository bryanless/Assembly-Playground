//
//  Level1AssembleCanvas.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

struct Level1AssembleCanvas: View {
  @Binding var selectedToolItem: ToolItemEnum?
  @Binding var selectedDockIndex: Int
  @Binding var isFigureExists: Bool
  @State var isNavigationTitlePlaced: Bool
  @State var isProfilePicturePlaced: Bool
  @State var isImagePlaced: [Bool]
  @State var isImageCaptionPlaced: [Bool]
  @State var isFigurePlaced: [Bool]
  var onPlaceholderTap: (Level1ComponentEnum) -> Void
  var onPlacedTap: (Level1ComponentEnum) -> Void

  init(
    selectedToolItem: Binding<ToolItemEnum?>,
    selectedDockIndex: Binding<Int>,
    isFigureExists: Binding<Bool>,
    isNavigationTitleHidden: Bool = false,
    isProfilePictureHidden: Bool = false,
    isImageHidden: [Bool] = Array(repeating: false, count: 6),
    isImageCaptionHidden: [Bool] = Array(repeating: false, count: 6),
    isFigurePlaced: [Bool] = Array(repeating: false, count: 6),
    onPlaceholderTap: @escaping (Level1ComponentEnum) -> Void,
    onPlacedTap: @escaping (Level1ComponentEnum) -> Void) {
      _selectedToolItem = selectedToolItem
      _selectedDockIndex = selectedDockIndex
      _isFigureExists = isFigureExists
      self.isNavigationTitlePlaced = isNavigationTitleHidden
      self.isProfilePicturePlaced = isProfilePictureHidden
      self.isImagePlaced = isImageHidden
      self.isImageCaptionPlaced = isImageCaptionHidden
      self.isFigurePlaced = isFigurePlaced
      self.onPlaceholderTap = onPlaceholderTap
      self.onPlacedTap = onPlacedTap
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
      NavigationTitleWireframeAssembleView(isPlaced: $isNavigationTitlePlaced) { componentType in
        if selectedDockIndex == 0 {
          withAnimation {
            isNavigationTitlePlaced.toggle()
          }
          onPlaceholderTap(componentType)
        }
      } onPlacedTap: { componentType in
        if selectedToolItem == .remove {
          withAnimation {
            isNavigationTitlePlaced.toggle()
          }
          onPlacedTap(componentType)
        }
      }
      Spacer(minLength: Space.extraLarge)
      ProfilePictureWireframeAssembleView(isPlaced: $isProfilePicturePlaced) { componentType in
        if selectedDockIndex == 1 {
          withAnimation {
            isProfilePicturePlaced.toggle()
          }
          onPlaceholderTap(componentType)
        }
      } onPlacedTap: { componentType in
        if selectedToolItem == .remove {
          withAnimation {
            isProfilePicturePlaced.toggle()
          }
          onPlacedTap(componentType)
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

  @ViewBuilder func gridItem(index: Int) -> some View {
    if isFigureExists {
      VStack {
        FigureWireframeAssembleView(isPlaced: $isFigurePlaced[index]) { componentType in
          if selectedDockIndex == 4 {
            withAnimation {
              isFigurePlaced[index].toggle()
            }
            onPlaceholderTap(componentType)
          }
        } onPlacedTap: { componentType in
          print("placed tapped")
          if selectedToolItem == .remove {
            withAnimation {
              isFigurePlaced[index].toggle()
            }
            onPlacedTap(componentType)
          }
      }
      }
    } else {
      VStack(alignment: .leading) {
        ImageWireframeAssembleView(isPlaced: $isImagePlaced[index]) { componentType in
          if selectedDockIndex == 2 {
            withAnimation {
              isImagePlaced[index].toggle()
            }
            onPlaceholderTap(componentType)
          }
        } onPlacedTap: { componentType in
          if selectedToolItem == .remove {
            withAnimation {
              isImagePlaced[index].toggle()
            }
            onPlacedTap(componentType)
          }
        }

        ImageCaptionWireframeAssembleView(isPlaced: $isImageCaptionPlaced[index]) { componentType in
          if selectedDockIndex == 3 {
            withAnimation {
              isImageCaptionPlaced[index].toggle()
            }
            onPlaceholderTap(componentType)
          }
        } onPlacedTap: { componentType in
          if selectedToolItem == .remove {
            withAnimation {
              isImageCaptionPlaced[index].toggle()
            }
            onPlacedTap(componentType)
          }
        }
      }
    }
  }
}

struct Level1AssembleCanvas_Previews: PreviewProvider {
  static var previews: some View {
    Level1AssembleCanvas(
      selectedToolItem: .constant(.duplicate),
      selectedDockIndex: .constant(0),
      isFigureExists: .constant(false)) { _ in

    } onPlacedTap: { _ in

    }
    .previewInterfaceOrientation(.landscapeLeft)
  }
}
