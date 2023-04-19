//
//  ProgressBar.swift
//  jamuMaking
//
//  Created by Evan Susanto on 26/03/23.
//

import SwiftUI

struct ProgressBar: View {
    var colorProgress: Color
    var colorBackground: Color
    
//    private var colorProgress: Color
//    private var colorBackground: CGColor
    @Binding var value: Int
    var maxValue: Int
    var height: CGFloat = 17
    var body: some View {
        ZStack{
            
            
            GeometryReader {
                geometry in
                VStack(spacing: 0){
                    ZStack(alignment: .leading) {
                        
                        RoundedRectangle(cornerRadius: 20).frame(width: geometry.size.width , height: height)
                            .opacity(0.3)
                            .foregroundColor(colorBackground)
                        RoundedRectangle(cornerRadius: 20).frame(width: min(CGFloat(Float(self.value)/Float(self.maxValue))*geometry.size.width, geometry.size.width), height: height)
                            .foregroundColor(colorProgress)
                            .animation(.linear)
                        Image("heart_circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90)
                            .padding(.leading, -4 )
                        
                    }.cornerRadius(45.0)
                    HStack{
                        Spacer()
                        Text("Hp: \(value)/\(maxValue)")
                            .font(JFont.bold(fontFamily: .poppins,size: 20))
                            .background(RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(JColor.white_card_bg)
                                .padding(-10)
                            )
                    }.padding(.horizontal, ViewPadding.medium)
                    
                }
                    
            }.padding(.horizontal, ViewPadding.mini)
        }
            }
    }


struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(colorProgress: .blue, colorBackground: .white,value: .constant(100),maxValue: 100)
    }
}
