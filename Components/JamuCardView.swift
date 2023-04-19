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
    var withCount: Bool = false
    var onPressed: Bool = false
    var forHeroView: Bool = false
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
                .font(JFont.bold(fontFamily: .poppins, size: 18))
                .foregroundColor(.white)
                .lineLimit(2)
                .multilineTextAlignment(.center)
            
            if(withCount){
                Text("Qty: " + String(count))
                    .font(JFont.medium(fontFamily: .poppins, size: 15))
                    .foregroundColor(.white)
                    .lineLimit(2)
            }
            
        }.frame(height: 175)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .frame(width: 150, height: 210)
                    .foregroundColor(
                        count == 0 && forHeroView ? JColor.grey : JColor.purpleSoft)
                    .cornerRadius(10)
                    
                
                    .background(
                        Rectangle()
                            .foregroundColor(.white)
                            .padding(.all, -ViewPadding.small)
                            .shadow(color: onPressed ? JColor.yellow.opacity(0.9): Color.gray.opacity(0.5) , radius: 10, x: 0, y: 5)
                    )
                
            )
            .overlay {
                count == 0 && forHeroView ? JColor.grey.opacity(0.9) : JColor.grey.opacity(0)
            }
        
        
        
        
    }
    
    //            RoundedRectangle(cornerRadius: 20, style: .continuous)
    //                .frame(width: 100, height: 100)
}


struct JamuCardView_Previews: PreviewProvider {
    static var previews: some View {
        JamuCardView(jamu: jamuEmpon, count: 0,forHeroView: true)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
