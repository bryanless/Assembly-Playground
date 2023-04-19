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
      if viewModel.isLevelComplete {
        LevelCompleteView()
      } else {
        content
      }
    }
    .padding()
  }
}

extension Level1View {
  var content: some View {
    VStack(spacing: Space.extraLarge) {
      HStack {
        CustomNavigationBar()
//        Button("end disassemble") {
//          viewModel.endDisassembleMode()
//        }.buttonStyle(.borderedProminent)
      }
      HStack(spacing: Space.large) {
        if viewModel.isAssembleMode {
          assembleGuide
          assembleCanvas
        } else {
          disassembleGuide
          mainCanvas
        }
        trailingBar
      }
    }
  }

  var disassembleGuide: some View {
    VStack(alignment: .leading, spacing: Space.extraLarge) {
      Text("Disassemble stage")
        .font(.title)
        .bold()

      VStack(alignment: .leading, spacing: Space.extraSmall) {
        Text("What is disassemble stage?")
          .font(.title3)
          .bold()
        Text("Before implementing a user interface (UI), you will need to deconstruct the UI design. Deconstruction helps you to find out the components used on a screen. This stage will help you to analyze the components used to create a simple screen.")
      }

      VStack(alignment: .leading, spacing: Space.extraSmall) {
        Text("What should you do?")
          .font(.title3)
          .bold()
        Text("You need to disassemble the components from the simple screen. **Tap each of the component on the simple screen to disassemble it.** There are 4 main components that are used.")
      }
      Spacer()
    }
    .padding()
    .frame(maxWidth: 320)
    .background(Color(uiColor: UIColor.secondarySystemFill))
    .cornerRadius(RoundedShape.large)
  }

  var assembleGuide: some View {
    VStack(alignment: .leading, spacing: Space.extraLarge) {
      Text("Assemble stage")
        .font(.title)
        .bold()

      VStack(alignment: .leading, spacing: Space.extraSmall) {
        Text("What is assemble stage?")
          .font(.headline)
        Text("Your next step is to recreate the simple screen using the components you have found earlier. You might notice that there is only 1 item for each of the component. When you create a screen, you will want to reuse as much component as possible to reduce the amount of time needed when building an app.")
      }

      VStack(alignment: .leading, spacing: Space.extraSmall) {
        Text("What should you do?")
          .font(.headline)
        Text("You need to reassemble the components to recreate the simple screen. **Tap a component from the right bar, then tap the corresponding component on the simple screen.** There are 3 tools above the components that will come in handy to help you pass this stage. Keep in mind that the duplicate tool is limited so use it as needed.")
      }
      Spacer()
    }
    .padding()
    .frame(maxWidth: 320)
    .background(Color(uiColor: UIColor.secondarySystemFill))
    .cornerRadius(RoundedShape.large)
  }

  /// Shows the example of wireframe that needs to be completed
  var assembleCanvas: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(uiColor: UIColor.secondarySystemFill))
      Level1AssembleCanvas(
        selectedToolItem: $viewModel.selectedToolItem,
        selectedDockIndex: $viewModel.selectedDockItemIndex,
        isFigureExists: $viewModel.isFigureExists) { componentType in
        viewModel.onPlaceholderComponentAssembleTap(componentType: componentType)
      } onPlacedTap: { componentType in
        viewModel.onPlacedComponentAssembleTap(componentType: componentType)
      }
      .padding(Space.extraLarge)
    }
    .cornerRadius(RoundedShape.large)
  }

  /// Main canvas for the player to disassemble the wireframe
  var mainCanvas: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color(uiColor: UIColor.secondarySystemFill))
      Level1MainCanvas { componentType in
        viewModel.onComponentTap(componentType: componentType)
      } onCanvasTap: {
        viewModel.onMainCanvasTap()
      }
      .padding(Space.extraLarge)
    }
    .cornerRadius(RoundedShape.large)
  }

  /// Disassembled components canvas
  var disassembleCanvas: some View {
    Rectangle()
      .foregroundColor(.indigo)
  }

  /// Shows the list of components and tools that are available
  var trailingBar: some View {
    VStack(spacing: Space.large) {
      if viewModel.isAssembleMode {
        TrailingToolsView(
          selectedTool: $viewModel.selectedToolItem,
          duplicateAmount: viewModel.duplicateToolAmount) { toolRole in
            viewModel.onTrailingToolItemTap(toolRole: toolRole)
          }
      }
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
