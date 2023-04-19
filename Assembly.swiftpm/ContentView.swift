import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationStack {
        MainMenuView()
          .preferredColorScheme(.dark)
      }
    }
}
