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
        amount: 0),
      TrailingDockItem(
        id: 1,
        component: ComponentItem<Level1ComponentEnum>(
          type: .profilePicture,
          view: AnyView(ProfilePictureWireframeView())),
        amount: 0),
      TrailingDockItem(
        id: 2,
        component: ComponentItem<Level1ComponentEnum>(
          type: .image,
          view: AnyView(ImageWireframeView())),
        amount: 0),
      TrailingDockItem(
        id: 3,
        component: ComponentItem<Level1ComponentEnum>(
          type: .imageCaption,
          view: AnyView(ImageCaptionWireframeView())),
        amount: 0),
    ]) {
      self.isAssembleMode = isAssembleMode
      self.trailingDockItems = trailingDockItems
    }
  
  func onComponentTap(componentType: Level1ComponentEnum) {
    if let index = trailingDockItems.firstIndex(where: { $0.component.type == componentType }) {
      withAnimation {
        trailingDockItems[index].amount += 1
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
