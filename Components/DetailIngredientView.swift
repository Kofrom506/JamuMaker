//
//  SwiftUIView.swift
//  
//
//  Created by Evan Susanto on 15/04/23.
//

import SwiftUI

struct DetailIngredientView: View {
    var ingridient: Ingredient
    var count: Int
    var body: some View {
        VStack{
            Image(ingridient.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .background(
                    Circle()
                        .foregroundColor(JColor.yellowSoft)
                        .padding(.all, -ViewPadding.medium)
                ).padding(.trailing, ViewPadding.small)
            Text("\(count) x \(ingridient.name)")
                .font(JFont.semiBold(fontFamily: .poppins, size: 30))
        }
    }
}

struct DetailIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        DetailIngredientView(ingridient: kunyit, count: 3)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
