//
//  TrailingToolRowItemView.swift
//  
//
//  Created by Bryan on 20/04/23.
//

import SwiftUI

struct TrailingToolRowItemView: View {
  let iconName: String
  let title: String
  let role: ToolItemEnum
  var roleAmount: Int
  var isSelected: Bool
  var onTap: (ToolItemEnum) -> Void

  init(
    iconName: String,
    title: String,
    role: ToolItemEnum,
    roleAmount: Int = 0,
    isSelected: Bool = false,
    onTap: @escaping (ToolItemEnum) -> Void) {
      self.iconName = iconName
      self.title = title
      self.role = role
      self.roleAmount = roleAmount
      self.isSelected = isSelected
      self.onTap = onTap
    }

  var body: some View {
    HStack {
      Image(systemName: iconName)
        .imageScale(.large)
      Text(title)
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(role == .duplicate && roleAmount < 1 ? Color.secondary : .indigo)
    .cornerRadius(RoundedShape.medium)
    .overlay {
      RoundedRectangle(cornerRadius: RoundedShape.medium)
        .stroke(Color.yellow, lineWidth: isSelected ? 4 : 0)
    }
    .gesture(tapGesture)
  }
}

extension TrailingToolRowItemView {
  var tapGesture: some Gesture {
    TapGesture()
      .onEnded {
        onTap(role)
      }
  }
}

struct TrailingToolRowItemView_Previews: PreviewProvider {
  static var previews: some View {
    TrailingToolRowItemView(
      iconName: "arrow.triangle.merge",
      title: "Merge",
      role: .merge,
      onTap: { _ in })
  }
}
