//
//  Ingredients.swift
//  jamuMaking
//
//  Created by Evan Susanto on 29/03/23.
//

import Foundation


struct Ingredient: Identifiable, Hashable{
    internal let id: UUID = UUID()
    let name: String
    let imageName: String
    var isUp = false
    var position = CGPoint.zero
    let code: String
    let description: String
    let location: [Location]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

var ingridients: [Ingredient] = [asamJawa, beras, cabe, garam, gulaAren, jahe, kayuManis, kencur, kunyit, madu, sambiloto, serai, sirih, temulawak]

let asamJawa = Ingredient(name: "Asam Jawa", imageName: "asamJawa", code: "A", description: "Asam Jawa is a sour fruit that is commonly used as a souring agent in Indonesian cuisine. It is rich in vitamin C and antioxidants, and is known to aid digestion and boost immunity. Asam Jawa is found in most parts of Indonesia, particularly in the tropical regions of Java and Sumatra.", location: [.jawa, .sumatra])

let beras = Ingredient(name: "Beras", imageName: "beras", code: "B", description: "Beras or rice is a staple food in Indonesia and is consumed by the majority of the population. It is a good source of carbohydrates, vitamins, and minerals. Rice is grown in many parts of Indonesia, particularly in Java, Bali, Sulawesi, and Sumatra.", location: [.jawa, .sulawesi, .sumatra])
let cabe = Ingredient(name: "Cabe", imageName: "cabe", code: "C", description: "Cabe or chili pepper is a popular spice that is widely used in Indonesian cuisine. It contains capsaicin, a compound that has anti-inflammatory and pain-relieving properties. Chili peppers are also a good source of vitamin C and are used in many Indonesian dishes to add heat and flavor. Chili peppers are found in many parts of Indonesia, particularly in Sumatra and Java.", location: [.jawa, .sumatra])
let garam = Ingredient(name: "Garam",imageName: "garam", code: "D", description: "Cabe or chili pepper is a popular spice that is widely used in Indonesian cuisine. It contains capsaicin, a compound that has anti-inflammatory and pain-relieving properties. Chili peppers are also a good source of vitamin C and are used in many Indonesian dishes to add heat and flavor. Chili peppers are found in many parts of Indonesia, particularly in Sumatra and Java.", location: [.jawa, .sumatra])

let gulaAren = Ingredient(name: "Gula Aren", imageName: "gulaAren", code: "E", description: "Gula Aren or palm sugar is a natural sweetener that is made from the sap of the palm tree. It is rich in minerals such as iron, potassium, and magnesium. Palm sugar is commonly used in Indonesian desserts and is found in many parts of Indonesia, particularly in Sumatra and Java.", location: [.jawa, .sumatra])
let jahe = Ingredient(name: "Jahe", imageName: "jahe", code: "F",description: "Jahe or ginger is a spice that is widely used in Indonesian cuisine. It has anti-inflammatory and antioxidant properties and is known to aid digestion and boost the immune system. Ginger is found in many parts of Indonesia, particularly in the tropical regions of Java and Sumatra.", location: [.jawa, .sumatra] )
let kayuManis = Ingredient(name: "Kayu Manis", imageName: "kayuManis", code: "G",description: "Kayu Manis or cinnamon is a spice that is used in Indonesian cuisine to add flavor to dishes. It has antioxidant and anti-inflammatory properties and is known to lower blood sugar levels. Cinnamon is found in many parts of Indonesia, particularly in the tropical regions of Java and Sumatra.", location: [.jawa, .sumatra])
let kencur = Ingredient(name: "Kencur", imageName: "kencur", code: "H",description: "Kencur or galangal is a root spice that is used in Indonesian cuisine. It has anti-inflammatory and antibacterial properties and is known to aid digestion. Kencur is mainly found in Java and Sumatra.", location: [.jawa, .sumatra])
let kunyit = Ingredient(name: "Kunyit", imageName: "kunyit", code: "I",description: "Kunyit or turmeric is a spice that is widely used in Indonesian cuisine. It has anti-inflammatory and antioxidant properties and is known to improve brain function and lower the risk of heart disease. Turmeric is found in many parts of Indonesia, particularly in Java and Bali.", location: [.jawa])
let madu = Ingredient(name: "Madu", imageName: "madu", code: "J",description: "Madu or honey is a natural sweetener that is rich in antioxidants and has antibacterial and anti-inflammatory properties. Honey is found in many parts of Indonesia, particularly in Sulawesi and Java.", location: [.jawa, .sulawesi])
let sambiloto = Ingredient(name: "Sambiloto", imageName: "sambiloto", code: "K",description: "Sambiloto or andrographis is a bitter herb that is commonly used in Indonesian traditional medicine. It is known to have anti-inflammatory, antibacterial, and antiviral properties and is used to treat various ailments. Sambiloto is found in many parts of Indonesia, particularly in Java and Sumatra.", location: [.jawa, .sumatra])
let serai = Ingredient(name: "Serai", imageName: "serai", code: "L",description: "Serai or lemongrass is a herb that is widely used in Indonesian cuisine. It has anti-inflammatory and antioxidant properties and is known to aid digestion and boost the immune system. Lemongrass is found in many parts of Indonesia, particularly in Java and Bali.", location: [.jawa])
let sirih = Ingredient(name: "Sirih", imageName: "sirih", code: "M",description: "Sirih or betel leaf is a herb that is commonly used in Indonesian traditional medicine. It has antibacterial and anti-inflammatory properties and is used to treat various ailments. Betel leaf is found in many parts of Indonesia, particularly in Java and Sumatra.", location: [.jawa, .sumatra])
let temulawak = Ingredient(name: "Temulawak", imageName: "temulawak", code: "N",description: "Temulawak is a plant that belongs to the ginger family and is commonly used in Indonesian traditional medicine. It has anti-inflammatory and antioxidant properties and is used to treat various ailments, including digestive issues and liver problems. Temulawak is mainly found in Java.", location: [.jawa])


let bahanError = Ingredient(name: "Error", imageName: "hearth_cirle", code: "", description: "", location: [])


