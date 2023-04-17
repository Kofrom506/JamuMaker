//
//  AddButton.swift
//  jamuMaking
//
//  Created by Evan Susanto on 26/03/23.
//

import SwiftUI

struct AddButton: View {
    @State var counter = 0
//    @State var item: Ingredients
    var body: some View {
        HStack{
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    counter+=1
                }
            Text("\(counter)")
            Image(systemName: "minus")
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    counter-=1
                }
                .overlay {
                    Circle()
                        .padding(.all, -ViewPadding.mini)
                }
        }.frame(width: 100)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
