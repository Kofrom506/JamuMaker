//
//  Ingredients.swift
//  jamuMaking
//
//  Created by Evan Susanto on 29/03/23.
//

import Foundation


struct Ingredient: Identifiable, Hashable{
    var id: UUID = UUID()
    var name: String
    var imageName: String
    var isUp = false
    var position = CGPoint.zero
    var code: String
    var description = ""
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

var ingridients: [Ingredient] = [asamJawa, beras, cabe, garam, gulaAren, jahe, kayuManis, kencur, kunyit, madu, sambiloto, serai, sirih, temulawak,bahanError]

let asamJawa = Ingredient(name: "Asam Jawa", imageName: "asamJawa", code: "A")
let beras = Ingredient(name: "Beras", imageName: "beras", code: "B")
let cabe = Ingredient(name: "Cabe", imageName: "cabe", code: "C")
let garam = Ingredient(name: "Garam", imageName: "garam", code: "D")
let gulaAren = Ingredient(name: "Gula Aren", imageName: "gulaAren", code: "E")
let jahe = Ingredient(name: "Jahe", imageName: "jahe", code: "F")
let kayuManis = Ingredient(name: "Kayu Manis", imageName: "kayuManis", code: "G")
let kencur = Ingredient(name: "Kencur", imageName: "kencur", code: "H")
let kunyit = Ingredient(name: "Kunyit", imageName: "kunyit", code: "I")
let madu = Ingredient(name: "Madu", imageName: "madu", code: "J")
let sambiloto = Ingredient(name: "Sambiloto", imageName: "sambiloto", code: "K")
let serai = Ingredient(name: "Serai", imageName: "serai", code: "L")
let sirih = Ingredient(name: "Sirih", imageName: "sirih", code: "M")
let temulawak = Ingredient(name: "Temulawak", imageName: "temulawak", code: "N")


let bahanError = Ingredient(name: "Error", imageName: "hearth_cirle", code: "")


