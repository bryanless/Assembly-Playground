//
//  Level1ViewModel.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

class Level1ViewModel: ObservableObject {
  @Published var isAssembleMode: Bool
  @Published var trailingDockItems: [TrailingDockItem<Level1ComponentEnum>]

  init(
    isAssembleMode: Bool = false,
    trailingDockItems: [TrailingDockItem<Level1ComponentEnum>] = [
      TrailingDockItem(
        id: 0,
        component: ComponentItem<Level1ComponentEnum>(
          type: .navigationTitle,
          view: AnyView(NavigationTitleWireframeView())),
        currentAmount: 0,
        maximumAmount: 1),
      TrailingDockItem(
        id: 1,
        component: ComponentItem<Level1ComponentEnum>(
          type: .profilePicture,
          view: AnyView(ProfilePictureWireframeView())),
        currentAmount: 0,
        maximumAmount: 1),
      TrailingDockItem(
        id: 2,
        component: ComponentItem<Level1ComponentEnum>(
          type: .image,
          view: AnyView(ImageWireframeView())),
        currentAmount: 0,
        maximumAmount: 6),
      TrailingDockItem(
        id: 3,
        component: ComponentItem<Level1ComponentEnum>(
          type: .imageCaption,
          view: AnyView(ImageCaptionWireframeView())),
        currentAmount: 0,
        maximumAmount: 6),
    ]) {
      self.isAssembleMode = isAssembleMode
      self.trailingDockItems = trailingDockItems
    }
  
  func onComponentTap(componentType: Level1ComponentEnum) {
    // Add component currentAmount
    if let index = trailingDockItems.firstIndex(where: { $0.component.type == componentType }) {
      withAnimation {
        trailingDockItems[index].currentAmount += 1
      }
    }

    // End disassemble mode when all components are disassembled
    if trailingDockItems.allSatisfy({ $0.currentAmount == $0.maximumAmount }) {
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        self.endDisassembleMode()
      }
    }
  }

  func endDisassembleMode() {
    // Show guide canvas, hide disassemble canvas, show trailing dock
    withAnimation {
      isAssembleMode = true
    }
  }
}
