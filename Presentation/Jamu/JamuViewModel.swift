//
//  JamuViewModel.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import Foundation

class JamuViewModel: ObservableObject {
    @Published var text: String = ""
    
    @Published var isClicked: Bool = false
//    @Published var isMixed: Bool = false
}
