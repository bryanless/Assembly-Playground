//
//  SwiftUIView.swift
//  
//
//  Created by Bryan on 14/04/23.
//

import SwiftUI

class Level1ViewModel: ObservableObject {
  @Published var isAssembleMode: Bool = false

  func endDisassembleMode() {
    // Show guide canvas, hide disassemble canvas, show trailing dock
    withAnimation {
      isAssembleMode = true
    }
  }
}
