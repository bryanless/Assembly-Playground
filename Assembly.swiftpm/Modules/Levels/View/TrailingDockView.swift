//
//  TrailingDockView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct TrailingDockView<ComponentType>: View {
  @Binding var selectedIndex: Int
  var items: [TrailingDockItem<ComponentType>]
  var onItemTap: (ComponentType) -> Void

  init(
    selectedIndex: Binding<Int>,
    items: [TrailingDockItem<ComponentType>],
    onItemTap: @escaping (ComponentType) -> Void = { _ in }) {
      _selectedIndex = selectedIndex
      self.items = items
      self.onItemTap = onItemTap
    }

  var body: some View {
    VStack {
      ForEach(items) { item in
        TrailingDockItemView(
          item: item,
          isSelected: selectedIndex == item.id,
          onTap: { componentType in
            selectedIndex = selectedIndex == item.id ? -1 : item.id
            onItemTap(componentType)
          })
      }
    }
  }
}

struct TrailingDockView_Previews: PreviewProvider {
  static var previews: some View {
    TrailingDockView<Level1ComponentEnum>(
      selectedIndex: .constant(-1),
      items: [
        TrailingDockItem(
          id: 0,
          component: ComponentItem(
            type: .navigationTitle,
            view: AnyView(NavigationTitleWireframeView())),
          currentAmount: 1),
        TrailingDockItem(
          id: 1,
          component: ComponentItem(
            type: .profilePicture,
            view: AnyView(ProfilePictureWireframeView())),
          currentAmount: 1),
        TrailingDockItem(
          id: 2,
          component: ComponentItem(
            type: .image,
            view: AnyView(ImageWireframeView())),
          currentAmount: 0),
        TrailingDockItem(
          id: 3,
          component: ComponentItem(
            type: .imageCaption,
            view: AnyView(ImageCaptionWireframeView())),
          currentAmount: 0)
      ])
    .previewInterfaceOrientation(.landscapeLeft)
  }
}
