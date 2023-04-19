//
//  JamuUsage.swift
//  jamuMaking
//
//  Created by Evan Susanto on 12/04/23.
//

import Foundation

class JamuReceipt: ObservableObject, Identifiable{

    let id: UUID = UUID()
    let ingridient: Ingredient
    let quantity: Int
    var _codes: String = ""
    
    init(ingridient: Ingredient, quantity: Int) {
        self.ingridient = ingridient
        self.quantity = quantity
        
    }
    public var codes: String {
        get {
            return String(repeating: self.ingridient.code, count: self.quantity)
        }
    }
    
    
}

