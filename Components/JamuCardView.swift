//
//  SwiftUIView.swift
//
//
//  Created by Evan Susanto on 15/04/23.
//

import SwiftUI

struct JamuCardView: View {
    var jamu: Jamu
    var count: Int = 0
    var body: some View {
        
        VStack(spacing: 0){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: 130, height: 130)
                .foregroundColor(JColor.white_card_bg)
                .padding(.bottom, ViewPadding.medium)
                .overlay(
                    Image(jamu.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                )
            
            Text(jamu.name)
                .font(JFont.bold(fontFamily: .poppins, size: 22))
                .foregroundColor(.white)
            
        }.frame(height: 175)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .frame(width: 150, height: 210)
                    .foregroundColor(JColor.blueSoft)
                
                    .background(
                        Rectangle()
                            .foregroundColor(.white)
                            .padding(.all, -ViewPadding.small)
                        
                    )
                
            )
        
        
        
        
    }
    
    //            RoundedRectangle(cornerRadius: 20, style: .continuous)
    //                .frame(width: 100, height: 100)
}


struct JamuCardView_Previews: PreviewProvider {
    static var previews: some View {
        JamuCardView(jamu: jamuJahe, count: 100)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
