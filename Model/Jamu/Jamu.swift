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
    var jamuDescription: String
    var isClicked: Bool = false
    
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




var jamus: [Jamu] = [jamuBerasKencur, jamuCabePuyang, jamuEmpon, jamuJahe, jamuJakutes, jamuKayuManis, jamuKunyitAsam, jamuKunyitMadu, jamuSambiloto, jamuSirih, jamuTemulawak, jamuZonk]

let jamuBerasKencur = Jamu(name: "Beras Kencur", imageName: "jamu_berasKencur", rarity: .epic, jamuReceipts: [JamuReceipt(ingridient: beras, quantity: 5),JamuReceipt(ingridient: gulaAren, quantity: 2), JamuReceipt(ingridient: kencur, quantity: 2), JamuReceipt(ingridient: madu, quantity: 1)], jamuDescription: "Jamu Beras Kencur is a traditional Indonesian herbal drink made from rice, kencur (a type of ginger), and other spices. It is commonly consumed as a natural remedy for digestive issues, menstrual cramps, and colds. It is also believed to have anti-inflammatory and antioxidant properties. Beras Kencur is a good source of carbohydrates, dietary fiber, and various vitamins and minerals.")

let jamuCabePuyang = Jamu(name: "Cabe Puyang", imageName: "jamu_cabePuyang", rarity: .rare, jamuReceipts: [JamuReceipt(ingridient: cabe, quantity: 3),JamuReceipt(ingridient: gulaAren, quantity: 2), JamuReceipt(ingridient: kunyit, quantity: 2)],jamuDescription: "Jamu Cabe Puyang is a traditional Indonesian herbal drink made from chili peppers (cabe), ginger, and other spices. It is commonly consumed as a natural remedy for various ailments, including headaches, sore throat, and digestive issues. It is also believed to have anti-inflammatory and pain-relieving properties. Cabe Puyang is a good source of vitamin C, vitamin B6, and various minerals.")
                                                                                        
let jamuTemulawak = Jamu(name: "Temulawak", imageName: "jamu_temulawak", rarity: .epic, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 2), JamuReceipt(ingridient: jahe, quantity: 1),JamuReceipt(ingridient: serai, quantity: 5), JamuReceipt(ingridient: temulawak, quantity: 1)],jamuDescription: "Jamu Temulawak is a traditional Indonesian herbal drink made from temulawak (Java ginger) and other spices. Temulawak is a type of ginger that has a bitter taste and is native to Indonesia. Jamu Temulawak is commonly consumed as a natural remedy for digestive issues, liver problems, and arthritis. It is also believed to have anti-inflammatory and antioxidant properties.")

let jamuKunyitAsam = Jamu(name: "Kunyit Asam", imageName: "jamu_kunyitAsam", rarity: .rare, jamuReceipts: [JamuReceipt(ingridient: asamJawa, quantity: 1),JamuReceipt(ingridient: gulaAren, quantity: 2), JamuReceipt(ingridient: kunyit, quantity: 2)], jamuDescription: "Jamu Kunyit Asam is a traditional Indonesian herbal drink made from turmeric and tamarind. It is commonly consumed as a natural remedy for digestive issues, menstrual cramps, and colds. It is also believed to have anti-inflammatory and antioxidant properties. Kunyit Asam is a good source of dietary fiber, vitamin C, and various minerals.")
                                                            

let jamuJakutes = Jamu(name: "Jakutes", imageName: "jamu_jakutes", rarity: .epic, jamuReceipts: [JamuReceipt(ingridient: jahe, quantity: 2), JamuReceipt(ingridient: kunyit, quantity: 1),JamuReceipt(ingridient: madu, quantity: 3), JamuReceipt(ingridient: serai, quantity: 1),JamuReceipt(ingridient: temulawak, quantity: 1)], jamuDescription: "Jamu Jakutes is a traditional Indonesian herbal drink made from various spices, including turmeric, ginger, and cinnamon. It is commonly consumed as a natural remedy for menstrual cramps, colds, and flu. It is also believed to have anti-inflammatory and antioxidant properties. Jakutes is a good source of dietary fiber, vitamin C, and various minerals.")

let jamuEmpon = Jamu(name: "Empon-Empon", imageName: "jamu_empon", rarity: .epic, jamuReceipts: [JamuReceipt(ingridient: jahe, quantity: 3), JamuReceipt(ingridient: kayuManis, quantity: 1),JamuReceipt(ingridient: kunyit, quantity: 2), JamuReceipt(ingridient: madu, quantity: 1),JamuReceipt(ingridient: temulawak, quantity: 1)],jamuDescription: "Jamu Empon is a traditional Indonesian herbal drink made from various spices, including ginger, turmeric, and cinnamon. It is commonly consumed as a natural remedy for menstrual cramps, colds, and flu. It is also believed to have anti-inflammatory and antioxidant properties. Empon is a good source of dietary fiber, vitamin C, and various minerals.")

let jamuKunyitMadu = Jamu(name: "Kunyit Madu", imageName: "jamu_kunyitMadu", rarity: .rare, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 1),JamuReceipt(ingridient: kunyit, quantity: 2), JamuReceipt(ingridient: madu, quantity: 1)],jamuDescription: "Jamu Kunyit Madu is a traditional Indonesian herbal drink made from turmeric and honey. It is commonly consumed as a natural remedy for colds, sore throat, and digestive issues. It is also believed to have anti-inflammatory and antioxidant properties. Kunyit Madu is a good source of dietary fiber, vitamin C, and various minerals.")
              
let jamuSirih = Jamu(name: "Sirih", imageName: "jamu_sirih", rarity: .common, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 1),JamuReceipt(ingridient: sirih, quantity: 2)],jamuDescription: "Jamu Sirih is a traditional Indonesian herbal drink made from betel leaves (sirih) and other spices. It is commonly consumed as a natural remedy for various health conditions such as bad breath, gum disease, and throat infections. In Indonesian culture, betel leaves are believed to have cleansing and healing properties.")

let jamuKayuManis = Jamu(name: "Kayu Manis", imageName: "jamu_kayuManis", rarity: .common, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 1),JamuReceipt(ingridient: kayuManis, quantity: 2)],jamuDescription: "Jamu Kayu Manis is a traditional Indonesian herbal drink made from cinnamon and other spices. It is commonly consumed as a natural remedy for colds, sore throat, and digestive issues. It is also believed to have anti-inflammatory and antioxidant properties. Kayu Manis is a good source of dietary fiber, vitamin C, and various minerals.")

let jamuJahe = Jamu(name: "Jahe", imageName: "jamu_jahe", rarity: .common, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 1),JamuReceipt(ingridient: jahe, quantity: 2)],jamuDescription: "Jamu Jahe is a traditional Indonesian herbal drink made from ginger and other spices. It is commonly consumed as a natural remedy for colds, sore throat, and digestive issues. It is also believed to have anti-inflammatory and antioxidant properties. Jahe is a good source of dietary fiber, vitamin C, and various minerals.")

let jamuSambiloto = Jamu(name: "Sambiloto", imageName: "jamu_sambiloto", rarity: .common, jamuReceipts: [JamuReceipt(ingridient: gulaAren, quantity: 1),JamuReceipt(ingridient: sambiloto, quantity: 2)],jamuDescription: "Jamu Sambiloto is a traditional Indonesian herbal drink made from bitter melon and other spices. It is commonly consumed as a natural remedy for digestive issues, fever, and malaria. It is also believed to have anti-inflammatory and antioxidant properties. Sambiloto is a good source of dietary fiber, vitamin C, and various minerals.")

let jamuZonk = Jamu(name: "Zonk", imageName: "jamu_zonk", rarity: .zonk, jamuReceipts: [],jamuDescription: """
                    The potion was a thick and murky liquid that was brewed in a large stone cauldron. It emitted a strong, unpleasant smell that made the eyes water and the stomach churn. The liquid was a deep shade of green and was flecked with small particles that floated around ominously.
                    
                    The ingredients of the potion were a closely guarded secret, known only to the person who brewed it. They were a mixture of rare and exotic plants, roots, and powders, some of which were highly poisonous if ingested in large quantities.

                    Despite its off-putting appearance and smell, the potions seems mysterious. It may cure a wide range of ailments, from headaches to fevers to more serious illnesses. However, it was also known to cause stomach aches and nausea in those who drank it.

                    The taste of the potion was bitter and acrid, leaving a foul taste in the mouth long after it had been consumed. The effects of the potion were almost immediate, causing the drinker to feel queasy and uncomfortable. It was also shrouded in mystery and superstition. "
            """
                    
)


// Yg kurang : gula merah, madu, asam jawa
//let kayuManis = Ingredients(name: "Kayu Manis", imageName: "kayuManis")
//let daunSirih = Ingredients(name: "Daun Sirih", imageName: "daunSirih")
//let sambiloto = Ingredients(name: "Sambiloto", imageName: "sambiloto")
//let kencur = Ingredients(name: "Kencur", imageName: "kencur")
//let cabeJawa = Ingredients(name: "Cabe Jawa", imageName: "cabeJawa")
//let bawangPutih = Ingredients(name: "Bawang Putih", imageName: "bawangPutih")
//let daunKemangi = Ingredients(name: "Daun Kemangi", imageName: "daunKemangi")
