//
//  TrailingDockItemView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct TrailingDockItemView<ComponentType>: View {
  var item: TrailingDockItem<ComponentType>
  var isSelected: Bool
  var onTap: (ComponentType) -> Void

  init(
    item: TrailingDockItem<ComponentType>,
    isSelected: Bool = false,
    onTap: @escaping (ComponentType) -> Void = { _ in }) {
      self.item = item
      self.isSelected = isSelected
      self.onTap = onTap
    }

  var body: some View {
    ZStack(alignment: .topTrailing) {
      ZStack(alignment: .center) {
        RoundedRectangle(cornerRadius: RoundedShape.medium)
          .foregroundColor(.gray)
          .padding()
          .background(.gray)
          .cornerRadius(RoundedShape.medium)

        item.component.view
          .padding()
          .background(.gray)
          .cornerRadius(RoundedShape.medium)
          .opacity(item.currentAmount == 0 ? 0 : 1)
          .simultaneousGesture(tapGesture)
      }

      Text(item.currentAmount.description)
        .frame(maxWidth: 40, maxHeight: 40)
        .background(.blue)
        .cornerRadius(RoundedShape.small)
        .opacity(item.currentAmount < 2 ? 0 : 1)
    }
    .cornerRadius(RoundedShape.medium)
    .overlay {
      RoundedRectangle(cornerRadius: RoundedShape.medium)
        .stroke(Color.yellow, lineWidth: isSelected ? 4 : 0)
    }
    .gesture(tapGesture)
  }
}

extension TrailingDockItemView {
  var tapGesture: some Gesture {
    TapGesture()
      .onEnded {
        onTap(item.component.type)
      }
  }
}

struct TrailingDockItemView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TrailingDockItemView<Level1ComponentEnum>(
        item: TrailingDockItem(
          id: 0,
          component: ComponentItem(
            type: .imageCaption,
            view: AnyView(ImageCaptionWireframeView()))))
      .previewLayout(.sizeThatFits)
      .padding()
      .previewDisplayName("Empty Dock Item")

      TrailingDockItemView<Level1ComponentEnum>(
        item: TrailingDockItem(
          id: 0,
          component: ComponentItem(
            type: .imageCaption,
            view: AnyView(ImageCaptionWireframeView())),
          currentAmount: 2),
        onTap: { _ in })
      .previewLayout(.sizeThatFits)
      .padding()
      .previewDisplayName("Dock Item")
    }
    .previewInterfaceOrientation(.landscapeLeft)
  }
}
