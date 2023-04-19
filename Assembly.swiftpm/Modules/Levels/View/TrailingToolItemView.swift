//
//  TrailingToolItemView.swift
//  
//
//  Created by Bryan on 19/04/23.
//

import SwiftUI

struct TrailingToolItemView: View {
  let iconName: String
  let role: ToolItemEnum
  var roleAmount: Int
  var isSelected: Bool
  var onTap: (ToolItemEnum) -> Void

  init(
    iconName: String,
    role: ToolItemEnum,
    roleAmount: Int = 0,
    isSelected: Bool = false,
    onTap: @escaping (ToolItemEnum) -> Void) {
      self.iconName = iconName
      self.role = role
      self.roleAmount = roleAmount
      self.isSelected = isSelected
      self.onTap = onTap
    }

  var body: some View {
    ZStack(alignment: .topTrailing) {
      ZStack(alignment: .center) {
        Image(systemName: iconName)
          .resizable()
          .aspectRatio(1, contentMode: .fit)
          .padding(Space.extraLarge)
          .background(.indigo)
        .cornerRadius(RoundedShape.medium)
      }
      .simultaneousGesture(tapGesture)

      Text(roleAmount.description)
        .frame(maxWidth: 32, maxHeight: 32)
        .background(.blue)
        .cornerRadius(RoundedShape.small)
        .opacity(roleAmount < 2 ? 0 : 1)
    }
    .cornerRadius(RoundedShape.medium)
    .overlay {
      RoundedRectangle(cornerRadius: RoundedShape.medium)
        .stroke(Color.yellow, lineWidth: isSelected ? 4 : 0)
    }
    .gesture(tapGesture)
  }
}

extension TrailingToolItemView {
  var tapGesture: some Gesture {
    TapGesture()
      .onEnded {
        onTap(role)
      }
  }
}

struct TrailingToolItemView_Previews: PreviewProvider {
  static var previews: some View {
    TrailingToolItemView(
      iconName: "plus.square.on.square",
      role: .duplicate,
      roleAmount: 6) { toolRole in

      }
  }
}
