//
//  IngridientsUsage.swift
//  jamuMaking
//
//  Created by Evan Susanto on 11/04/23.
//

import Foundation

class IngridientUsage: ObservableObject, Identifiable, Equatable{
    static func == (lhs: IngridientUsage, rhs: IngridientUsage) -> Bool {
        lhs.id == rhs.id
    }
    let id: UUID = UUID()
    let ingridient: Ingredient
    @Published var usage: Int
    
    init(ingridient: Ingredient, usage: Int) {
        self.ingridient = ingridient
        self.usage = usage
    }
}

class IngridientsUsage: ObservableObject{
    @Published var ingridientsU: [IngridientUsage]
    
    init(){
        self.ingridientsU = [asamJawaU, berasU, cabeU, garamU, gulaArenU, jaheU, kayuManisU, kencurU, kunyitU, maduU, sambilotoU,seraiU,sirihU,temulawakU]
    }
}


let asamJawaU = IngridientUsage(ingridient: asamJawa, usage: 0)
let berasU = IngridientUsage(ingridient: beras, usage: 0)
let garamU = IngridientUsage(ingridient: garam, usage: 0)
let gulaArenU = IngridientUsage(ingridient: gulaAren, usage: 0)
let jaheU = IngridientUsage(ingridient: jahe, usage: 0)
let kayuManisU = IngridientUsage(ingridient: kayuManis, usage: 0)
let kencurU = IngridientUsage(ingridient: kencur, usage: 0)
let kunyitU = IngridientUsage(ingridient: kunyit, usage: 0)
let maduU = IngridientUsage(ingridient: madu, usage: 0)
let sambilotoU = IngridientUsage(ingridient: sambiloto, usage: 0)
let seraiU = IngridientUsage(ingridient: serai, usage: 0)
let sirihU = IngridientUsage(ingridient: sirih, usage: 0)
let temulawakU = IngridientUsage(ingridient: temulawak, usage: 0)
let cabeU = IngridientUsage(ingridient: cabe, usage: 0)
