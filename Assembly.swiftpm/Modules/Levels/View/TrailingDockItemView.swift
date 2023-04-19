//
//  TrailingDockItemView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct TrailingDockItemView<ComponentType>: View {
  var item: TrailingDockItem<ComponentType>

  var body: some View {
    ZStack(alignment: .topTrailing) {
      RoundedRectangle(cornerRadius: RoundedShape.medium)
        .foregroundColor(.gray)
        .frame(width: 100, height: 100)
        .padding()
        .background(.gray)
        .cornerRadius(RoundedShape.medium)

      item.component.view
        .frame(width: 100, height: 100)
        .padding()
        .background(.gray)
        .cornerRadius(RoundedShape.medium)
        .opacity(item.currentAmount == 0 ? 0 : 1)

      Text(item.currentAmount.description)
        .frame(maxWidth: 30, maxHeight: 30)
        .background(.blue)
        .cornerRadius(RoundedShape.small)
        .opacity(item.currentAmount < 2 ? 0 : 1)
    }
    .cornerRadius(RoundedShape.medium)
    .padding(.trailing, 20)
  }
}

struct TrailingDockItemView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TrailingDockItemView<Level1ComponentEnum>(item: TrailingDockItem(
        id: 0,
        component: ComponentItem(
          type: .imageCaption,
          view: AnyView(ImageCaptionWireframeView()))))
      .previewLayout(.sizeThatFits)
      .padding()
      .previewDisplayName("Empty Dock Item")

      TrailingDockItemView<Level1ComponentEnum>(item: TrailingDockItem(
        id: 0,
        component: ComponentItem(
          type: .imageCaption,
          view: AnyView(ImageCaptionWireframeView()))))
      .previewLayout(.sizeThatFits)
      .padding()
      .previewDisplayName("Dock Item")
    }
    .previewInterfaceOrientation(.landscapeLeft)
  }
}
