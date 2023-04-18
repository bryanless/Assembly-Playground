//
//  TrailingDockView.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import SwiftUI

struct TrailingDockView<ComponentType>: View {
  var items: [TrailingDockItem<ComponentType>]

  var body: some View {
    VStack {
      ForEach(items) { item in
        TrailingDockItemView(item: item)
      }
    }
  }
}

struct TrailingDockView_Previews: PreviewProvider {
  static var previews: some View {
    TrailingDockView<Level1ComponentEnum>(items: [
      TrailingDockItem(
        id: 0,
        component: ComponentItem(
          type: .navigationTitle,
          view: AnyView(NavigationTitleWireframeView())),
        amount: 1),
      TrailingDockItem(
        id: 1,
        component: ComponentItem(
          type: .profilePicture,
          view: AnyView(ProfilePictureWireframeView())),
        amount: 1),
      TrailingDockItem(
        id: 2,
        component: ComponentItem(
          type: .image,
          view: AnyView(ImageWireframeView())),
        amount: 0),
      TrailingDockItem(
        id: 3,
        component: ComponentItem(
          type: .imageCaption,
          view: AnyView(ImageCaptionWireframeView())),
        amount: 0)
    ])
    .previewInterfaceOrientation(.landscapeLeft)
  }
}
