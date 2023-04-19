//
//  LevelCompleteView.swift
//  
//
//  Created by Bryan on 20/04/23.
//

import SwiftUI

struct LevelCompleteView: View {
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    VStack {
      Text("Congratulation!!!")
      Button("Return to main menu") {
        dismiss()
      }
    }
  }
}

struct LevelCompleteView_Previews: PreviewProvider {
  static var previews: some View {
    LevelCompleteView()
  }
}
