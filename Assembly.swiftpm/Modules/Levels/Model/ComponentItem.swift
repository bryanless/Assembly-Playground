//
//  ComponentItem.swift
//  
//
//  Created by Bryan on 18/04/23.
//

import Foundation
import SwiftUI

struct ComponentItem<ComponentType> {
  let type: ComponentType
  let view: any View
}
