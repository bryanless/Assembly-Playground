//
//  FigureWireframeView.swift
//  
//
//  Created by Bryan on 20/04/23.
//

import SwiftUI

struct FigureWireframeView: View {
  var body: some View {
    VStack(alignment: .leading) {
      ImageWireframeView()
      ImageCaptionWireframeView()
    }
  }
}

struct FigureWireframeView_Previews: PreviewProvider {
  static var previews: some View {
    FigureWireframeView()
  }
}
