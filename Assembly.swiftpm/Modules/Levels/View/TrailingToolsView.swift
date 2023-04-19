//
//  TrailingToolsView.swift
//  
//
//  Created by Bryan on 19/04/23.
//

import SwiftUI

struct TrailingToolsView: View {
  var body: some View {
    HStack {
      Rectangle()
        .aspectRatio(1, contentMode: .fit)
      Rectangle()
        .aspectRatio(1, contentMode: .fit)
    }
  }
}

struct TrailingToolsView_Previews: PreviewProvider {
  static var previews: some View {
    TrailingToolsView()
  }
}
