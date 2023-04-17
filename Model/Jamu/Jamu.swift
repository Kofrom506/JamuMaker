//
//  Jamu.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import Foundation


struct Jamu: Hashable, Identifiable, Equatable{
    var id = UUID()
    var name: String
    var imageName: String 
    var effect: Int = 0
    var rarity: JamuRarity
    var jamuReceipts: [JamuReceipt]
    
    static func == (lhs: Jamu, rhs: Jamu) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var codes: String {
        get {
            var codes: String = ""
            var jamuReceiptSorted = self.jamuReceipts
            for item in jamuReceiptSorted{
                codes.append(item.codes)
            }
            return codes
        }
        set{
            
        }
    }
}




var jamus: [Jamu] = [jamuBerasKencur, jamuCabePuyang, jamuEmpon, jamuJahe, jamuJakutes, jamuKayuManis, jamuKunyitAsam, jamuKunyitMadu, jamuSambiloto, jamuSirih, jamuTemulawak, jamuZonk
                     
                     //                     jamuJahe,jamuTemulawak,jamuKayuManis,jamuSirih,jamuSambiloto,jamuCabeJawa,jamuBawangPutih,jamuKemangi,jamuBerasKencur,jamuKunyitMadu
]
let jamuBerasKencur = Jamu(name: "Beras Kencur", imageName: "jamu_berasKencur", rarity: .epic, jamuReceipts: [JamuReceipt(ingridient: beras, quantity: 5),JamuReceipt(ingridient: gulaAren, quantity: 2), JamuReceipt(ingridient: kencur, quantity: 2), JamuReceipt(ingridient: madu, quantity: 1)])

let jamuCabePuyang = Jamu(name: "Cabe Puyang", imageName: "jamu_cabePuyang", rarity: .rare, jamuReceipts: [JamuReceipt(ingridient: cabe, quantity: 3),JamuReceipt(ingridient: gulaAren, quantity: 2), JamuReceipt(ingridient: kunyit, quantity: 2)])
                                                                                        
let jamuTemulawak = Jamu(name: "Temulawak", imageName: "jamu_temulawak", rarity: .epic, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 2), JamuReceipt(ingridient: jahe, quantity: 1),JamuReceipt(ingridient: serai, quantity: 5), JamuReceipt(ingridient: temulawak, quantity: 1)])

let jamuKunyitAsam = Jamu(name: "Kunyit Asam", imageName: "jamu_kunyitAsam", rarity: .rare, jamuReceipts: [JamuReceipt(ingridient: asamJawa, quantity: 1),JamuReceipt(ingridient: gulaAren, quantity: 2), JamuReceipt(ingridient: kunyit, quantity: 2)])
                                                            

let jamuJakutes = Jamu(name: "Jakutes", imageName: "jamu_jakutes", rarity: .epic, jamuReceipts: [JamuReceipt(ingridient: jahe, quantity: 2), JamuReceipt(ingridient: kunyit, quantity: 1),JamuReceipt(ingridient: madu, quantity: 3), JamuReceipt(ingridient: serai, quantity: 1),JamuReceipt(ingridient: temulawak, quantity: 1)])

let jamuEmpon = Jamu(name: "Empon-Empon", imageName: "jamu_empon", rarity: .epic, jamuReceipts: [JamuReceipt(ingridient: jahe, quantity: 3), JamuReceipt(ingridient: kayuManis, quantity: 1),JamuReceipt(ingridient: kunyit, quantity: 2), JamuReceipt(ingridient: madu, quantity: 1),JamuReceipt(ingridient: temulawak, quantity: 1)])

let jamuKunyitMadu = Jamu(name: "Kunyit Madu", imageName: "jamu_kunyitMadu", rarity: .rare, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 1),JamuReceipt(ingridient: kunyit, quantity: 2), JamuReceipt(ingridient: madu, quantity: 1)])
              
let jamuSirih = Jamu(name: "Sirih", imageName: "jamu_sirih", rarity: .common, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 1),JamuReceipt(ingridient: sirih, quantity: 2)])

let jamuKayuManis = Jamu(name: "Kayu Manis", imageName: "jamu_kayuManis", rarity: .common, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 1),JamuReceipt(ingridient: kayuManis, quantity: 2)])

let jamuJahe = Jamu(name: "Jahe", imageName: "jamu_jahe", rarity: .common, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 1),JamuReceipt(ingridient: kayuManis, quantity: 2)])

let jamuSambiloto = Jamu(name: "Sambiloto", imageName: "jamu_sambiloto", rarity: .common, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 1),JamuReceipt(ingridient: sambiloto, quantity: 1)])

let jamuZonk = Jamu(name: "Zonk", imageName: "jamu_zonk", rarity: .zonk, jamuReceipts: [])


// Yg kurang : gula merah, madu, asam jawa
//let kayuManis = Ingredients(name: "Kayu Manis", imageName: "kayuManis")
//let daunSirih = Ingredients(name: "Daun Sirih", imageName: "daunSirih")
//let sambiloto = Ingredients(name: "Sambiloto", imageName: "sambiloto")
//let kencur = Ingredients(name: "Kencur", imageName: "kencur")
//let cabeJawa = Ingredients(name: "Cabe Jawa", imageName: "cabeJawa")
//let bawangPutih = Ingredients(name: "Bawang Putih", imageName: "bawangPutih")
//let daunKemangi = Ingredients(name: "Daun Kemangi", imageName: "daunKemangi")
