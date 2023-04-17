////
////  SwiftUIView.swift
////  
////
////  Created by Evan Susanto on 15/04/23.
////
//
//import SwiftUI
//
//struct ElementCard: View {
//    var jamu: Jamu
////    private var cardTitle: String
//    
////    init(iconName: String, cardTitle: String) {
////        self.iconName = iconName
////        self.cardTitle = cardTitle
////    }
//    
//    var body: some View {
//        VStack (spacing: 10) {
//            Image(jamu.imageName)
//                .foregroundColor(JColor.purpleSoft)
//            Text(jamu.name)
//                .font(Font.custom("LeagueSpartan-SemiBold", size: 12))
//                .foregroundColor(.black)
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .padding(.vertical, ViewPadding.medium)
//        .background(Color.white)
//        .cornerRadius(25)
//        .shadow(color: JColor.black.opacity(0.1), radius: 5, x: 0, y: 0)
//    }
//}
//
//struct ElementCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ElementCard(jamu: jamuJahe)
//    }
//}
