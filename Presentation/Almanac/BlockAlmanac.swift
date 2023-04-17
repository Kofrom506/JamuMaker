//
//  BlockAlmanca.swift
//  jamuMaking
//
//  Created by Evan Susanto on 29/03/23.
//

import SwiftUI

struct BlockAlmanac: View {
    var ingredients: Ingredient
    var body: some View {
        Image(ingredients.name)
            
    }
}

struct BlockAlmanac_Previews: PreviewProvider {
    static var previews: some View {
        BlockAlmanac(ingredients: jahe)
    }
}
