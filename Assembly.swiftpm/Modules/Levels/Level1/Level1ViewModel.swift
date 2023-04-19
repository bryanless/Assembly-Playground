//
//  Level1ViewModel.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

class Level1ViewModel: ObservableObject {
  private var previousSelectedDockItemIndex: Int = -1

  @Published var isAssembleMode: Bool = false
  @Published var selectedToolItem: ToolItemEnum?
  @Published var duplicateToolAmount: Int = 5
  @Published var selectedDockItemIndex: Int = -1
  @Published var trailingDockItems: [TrailingDockItem<Level1ComponentEnum>] = [
    TrailingDockItem(
      id: 0,
      component: ComponentItem<Level1ComponentEnum>(
        type: .navigationTitle,
        view: AnyView(NavigationTitleWireframeView())),
      maximumAmount: 1),
    TrailingDockItem(
      id: 1,
      component: ComponentItem<Level1ComponentEnum>(
        type: .profilePicture,
        view: AnyView(ProfilePictureWireframeView())),
      maximumAmount: 1),
    TrailingDockItem(
      id: 2,
      component: ComponentItem<Level1ComponentEnum>(
        type: .image,
        view: AnyView(ImageWireframeView())),
      maximumAmount: 6),
    TrailingDockItem(
      id: 3,
      component: ComponentItem<Level1ComponentEnum>(
        type: .imageCaption,
        view: AnyView(ImageCaptionWireframeView())),
      maximumAmount: 6),
  ]
  @Published var isFigureExists: Bool = false
  @Published var isLevelComplete: Bool = false

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

  func onPlaceholderComponentAssembleTap(componentType: Level1ComponentEnum) {
    // Reduce component currentAmount
    if let index = trailingDockItems.firstIndex(where: { $0.component.type == componentType }) {
      withAnimation {
        selectedDockItemIndex = -1
        trailingDockItems[index].currentAmount -= 1
        trailingDockItems[index].placedAmount += 1
      }
    }

    // End assemble mode when canvas is filled
    if trailingDockItems.allSatisfy({ $0.placedAmount == $0.maximumAmount }) {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        withAnimation {
          self.isLevelComplete = true
        }
      }
    }
  }

  func onPlacedComponentAssembleTap(componentType: Level1ComponentEnum) {
    switch selectedToolItem {
    case .none: return
    case .duplicate: return
    case .merge: return
    case .remove:
      if let index = trailingDockItems.firstIndex(where: { $0.component.type == componentType }) {
        withAnimation {
          trailingDockItems[index].currentAmount += 1
          trailingDockItems[index].placedAmount -= 1
        }
      }
    }
  }

  func onMainCanvasTap() {
    // Enable tap only in assemble mode
    guard selectedDockItemIndex >= 0 else {
      return
    }

    print("Canvas tapped")
  }

  func onTrailingToolItemTap(toolRole: ToolItemEnum) {
    // Remove currently active dock item
    if selectedDockItemIndex >= 0 {
      selectedDockItemIndex = -1
    }
  }

  func onTrailingDockItemTap(componentType: Level1ComponentEnum) {
    switch selectedToolItem {
    case .none:
      break
    case .duplicate:
      if let index = trailingDockItems.firstIndex(where: { $0.component.type == componentType }) {
        withAnimation {
          duplicateToolAmount -= 1
          trailingDockItems[index].currentAmount += 1

          // Remove currently active tool
          selectedToolItem = nil
        }
      }
    case .merge:
      withAnimation {
        if (previousSelectedDockItemIndex == 2
            || previousSelectedDockItemIndex == 3)
            && (selectedDockItemIndex == 2
                || selectedDockItemIndex == 3) {
          // Merge success
          // Remove the first selected component
          trailingDockItems.remove(at: previousSelectedDockItemIndex)
          if previousSelectedDockItemIndex < selectedDockItemIndex {
            selectedDockItemIndex -= 1
          }
          // Replace the last selected component with a merged component
          trailingDockItems[selectedDockItemIndex] = TrailingDockItem(
            id: 4,
            component: ComponentItem<Level1ComponentEnum>(
              type: .figure,
              view: AnyView(FigureWireframeView())),
            currentAmount: 1,
            maximumAmount: 6)

          // Remove currently active tool
          selectedToolItem = nil

          isFigureExists = true
        }

        if (previousSelectedDockItemIndex != -1) {
          // Merge failed, reset selection
          previousSelectedDockItemIndex = -1
          selectedDockItemIndex = -1
        }
      }
      // Keep first dock item that is selected
      previousSelectedDockItemIndex = selectedDockItemIndex
    case .remove:
      withAnimation {
        if let index = trailingDockItems.firstIndex(where: { $0.component.type == componentType }) {
          if trailingDockItems[index].currentAmount > 1
              || trailingDockItems[index].placedAmount > 0 {
            selectedDockItemIndex = -1
            duplicateToolAmount += 1
            trailingDockItems[index].currentAmount -= 1
          }
        }
        // Remove currently active tool
        selectedToolItem = nil
      }
    }
  }

  func endDisassembleMode() {
    withAnimation {
      // Show guide canvas, hide disassemble canvas
      isAssembleMode = true

      // Reset all component amount to 1
      for index in 0..<trailingDockItems.count {
        trailingDockItems[index].currentAmount = 1
      }
    }
  }
}
