//
//  TrailingDockItem.swift
//  
//
//  Created by Bryan on 18/04/23.
//

struct TrailingDockItem<ComponentType>: Identifiable {
  let id: Int
  var component: ComponentItem<ComponentType>
  var currentAmount: Int = 0
  var maximumAmount: Int = 0
}
