//
//  Level1View.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

struct Level1View: View {
  @StateObject var viewModel = Level1ViewModel()

  var body: some View {
    HiddenNavBarView {
      VStack(spacing: Space.extraLarge) {
        CustomNavigationBar()
        HStack(spacing: Space.large) {
          if viewModel.isAssembleMode {
            assembleCanvas
          } else {
            mainCanvas
          }
          trailingBar
        }
        Button("end disassemble") {
          viewModel.endDisassembleMode()
        }.buttonStyle(.borderedProminent)
      }
    }
    .padding()
  }
}

extension Level1View {
  /// Shows the example of wireframe that needs to be completed
  var assembleCanvas: some View {
    ZStack {
      Rectangle()
        .foregroundColor(.blue)
      Level1AssembleCanvas(selectedDockIndex: $viewModel.selectedDockItemIndex) { componentType in
        viewModel.onComponentAssembleTap(componentType: componentType)
      }
      .padding(Space.extraLarge)
    }
  }

  /// Main canvas for the player to disassemble the wireframe
  var mainCanvas: some View {
    ZStack {
      Rectangle()
        .foregroundColor(.mint)
      Level1MainCanvas { componentType in
        viewModel.onComponentTap(componentType: componentType)
      } onCanvasTap: {
        viewModel.onMainCanvasTap()
      }
      .padding(Space.extraLarge)
    }
  }

  /// Disassembled components canvas
  var disassembleCanvas: some View {
    Rectangle()
      .foregroundColor(.indigo)
  }

  /// Shows the list of components and tools that are available
  var trailingBar: some View {
    VStack(spacing: Space.large) {
      TrailingToolsView()
      TrailingDockView<Level1ComponentEnum>(
        selectedIndex: $viewModel.selectedDockItemIndex,
        items: viewModel.trailingDockItems,
        onItemTap: { componentType in
          viewModel.onTrailingDockItemTap(componentType: componentType)
        })
      .disabled(!viewModel.isAssembleMode)
    }
    .frame(maxWidth: 180)
  }
}

struct Level1View_Previews: PreviewProvider {
  static var previews: some View {
    Level1View()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
