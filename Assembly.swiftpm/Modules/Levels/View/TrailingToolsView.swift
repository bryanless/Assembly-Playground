//
//  TrailingToolsView.swift
//  
//
//  Created by Bryan on 19/04/23.
//

import SwiftUI

struct TrailingToolsView: View {
  @Binding var selectedTool: ToolItemEnum?
  var duplicateAmount: Int
  var onItemTap: (ToolItemEnum) -> Void

  var body: some View {
    HStack {
      TrailingToolItemView(
        iconName: "plus.square.on.square",
        role: .duplicate,
        roleAmount: duplicateAmount,
        isSelected: selectedTool == .duplicate) { toolRole in
          if duplicateAmount > 0 {
            selectedTool = selectedTool == toolRole ? nil : .duplicate
            onItemTap(toolRole)
          }
        }
      TrailingToolItemView(
        iconName: "trash",
        role: .remove,
        isSelected: selectedTool == .remove) { toolRole in
          selectedTool = selectedTool == toolRole ? nil : .remove
          onItemTap(toolRole)
        }
    }
  }
}

struct TrailingToolsView_Previews: PreviewProvider {
  static var previews: some View {
    TrailingToolsView(
      selectedTool: .constant(.duplicate),
      duplicateAmount: 6) { _ in

      }
  }
}
