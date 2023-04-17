//
//  RouterFactory.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import Foundation
import SwiftUI


protocol RouterFactory {
    associatedtype Body: View
    associatedtype Screen: ScreenProtocol
    
    @ViewBuilder func makeBody(for screen: Screen) -> Self.Body
}

