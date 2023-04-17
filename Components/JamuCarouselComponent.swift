//
//  CardView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 11/04/23.
//

import SwiftUI

struct JamuCarouselComponent: View {
    var jamu: Jamu
    var geo: GeometryProxy
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
//            .background(.red)
            .frame(width: geo.size.width*1/4, height: geo.size.height*1/3)
            .foregroundColor(JColor.white)
            .overlay(
                VStack(spacing: 0,content: {
                    Image(jamu.imageName)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .padding(30)
                    
                    Text(jamu.name)
                        .font(JFont.semiBold(fontFamily: .poppins,size: 20))
                        .foregroundColor(JColor.black)
                    Text("HP regen")
                        .font(JFont.regular(fontFamily: .poppins, size: 15))
                        .foregroundColor(.white)
                        .background(
                            Capsule()
                                .foregroundColor(JColor.greenSoft)
                                .padding(.vertical, -2)
                                .padding(.horizontal, -20)
                        ).padding(10)
                    Text("Click Here")
                        .foregroundColor(.white)
                        .font(JFont.medium(fontFamily: .poppins, size: 15))
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(JColor.green)
                        .cornerRadius(25)
                        .padding(.horizontal,50)
//                    NavigationLink(destination: mainView()) {
//                        Text("Click Here")
//                            .foregroundColor(.white)
//                            .font(JFont.medium(fontFamily: .poppins, size: 15))
//                            .frame(maxWidth: .infinity, maxHeight: 40)
//                            .background(JColor.green)
//                            .cornerRadius(25)
//                            .padding(.horizontal,50)
//                        
//                    }
                    
                    
                    
                }).padding(.bottom, 50)
                
            )
    }
}

//struct JamuCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        JamuCardView(jamu: kun, geo: <#GeometryProxy#>)
//    }
//}
