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
    VStack(spacing: Space.extraLarge) {
      VStack(spacing: Space.small) {
        Text("You did it!!!")
          .font(.largeTitle)
          .bold()
        Text("You have learned the basics to implement a user interface design!\nDeconstructing a design is a must-have skill that will surely help you to analyze and split a screen into smaller pieces\n\n Keep in mind to create a smaller component for components that will appear a couple of times.\nThis way, you can always reuse the components for other screen.")
          .multilineTextAlignment(.center)
      }
      Button {
        dismiss()
      } label: {
        Text("Return to main menu")
          .padding(.vertical, Space.small)
          .padding(.horizontal, 48)
      }
      .buttonStyle(.borderedProminent)
      
    }
    .padding(Space.medium)
  }
}

struct LevelCompleteView_Previews: PreviewProvider {
  static var previews: some View {
    LevelCompleteView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
