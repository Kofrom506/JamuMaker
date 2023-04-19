//
//  AddMinusButton.swift
//  jamuMaking
//
//  Created by Evan Susanto on 08/04/23.
//

import SwiftUI

struct AddSubstractValue: View {
    @ObservedObject private var ingridientUsage: IngridientUsage
    
    
    
    private let title: String
    private let text: String
    private var max: Int
    
    init(title: String, withConcat: Bool = false, text: String = "", ingridientUsage: IngridientUsage, max: Int){
        self.ingridientUsage = ingridientUsage
        self.title = title
        self.text = text
        self.max = max
    }
    
    var body: some View {
        HStack (spacing: 0) {
            Image(ingridientUsage.ingridient.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60)
                .background(
                    Circle()
                        .foregroundColor(max != 0 ? JColor.yellowSoft : JColor.grey)
                        .padding(.all, -ViewPadding.small)
                ).padding(.trailing, ViewPadding.small)
            
            Text(title)
            
                .foregroundColor(JColor.black)
                .font(JFont.semiBold(fontFamily: .poppins, size:  25))

                .foregroundColor(JColor.black)
                .padding(.leading, ViewPadding.small)
            
            Spacer()
            Button {
                if(ingridientUsage.usage > 0 ){
                    ingridientUsage.usage -= 1
                    print(ingridientUsage.usage)
                }
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(JColor.white)
                    .frame(width: 30, height: 30)
                    .background(ingridientUsage.usage > 0 ? JColor.greenSoft : JColor.grey)
                    .cornerRadius(10)
            }
//            if(withConcat){
//                Spacer()
//            }
            
            Text(String(ingridientUsage.usage) + " / \(max)")
                .foregroundColor(JColor.black)
                .padding(.horizontal, ViewPadding.medium)
            
                .font(.system(size: 20))
            
//            if(withConcat){
//                Spacer()
//            }
            Button {
                if(ingridientUsage.usage < max ){
                    ingridientUsage.usage += 1
                    print(ingridientUsage.usage)
                }
                
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(JColor.white)
                    .frame(width: 30, height: 30)
                    .background(ingridientUsage.usage<max ? JColor.greenSoft : JColor.grey)
                    .cornerRadius(10)
            }
        }
    }
}

struct AddSubstractValue_Previews: PreviewProvider {
    static var previews: some View {
        AddSubstractValue(title: "Evan", ingridientUsage: jaheU, max: 10)
    }
}
