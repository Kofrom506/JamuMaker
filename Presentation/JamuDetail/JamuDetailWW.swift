//
//  SwiftUIView.swift
//  
//
//  Created by Evan Susanto on 16/04/23.
//

import SwiftUI

struct JamuDetailsWW: View {
    var jamu: Jamu
    @State var percentage: Float = 0.85
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                JColor.gradientPurple
                    .ignoresSafeArea()
                VStack{
                    Image("background")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .blendMode(.softLight)
                        .ignoresSafeArea()
                    Spacer()
                    
                       
                }
                
                VStack(alignment: .center) {
                    Spacer()
                        .frame(height: geo.size.height*0.1)
                    Rectangle()

//                        .cornerRadius(40, corners: [)
                        .cornerRadius(40)
                        .foregroundColor(JColor.white)
                        .frame(maxHeight: .infinity)
                        .overlay(
                            VStack(alignment: .center, spacing: 10, content: {
                                Spacer()
                                    .frame(height: 20)
                                ZStack{
                                    Circle()
                                        .foregroundColor(JColor.white)
                                        .frame(width:123)
                                        .shadow(radius: 10)
                                    Image(jamu.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:68,height: 75)
                                        .padding(.leading,6)
                                }

                                .padding(.top,-80)
                                ScrollView(showsIndicators: false){
                                    VStack(alignment: .center, spacing: 10){
//                                        TopContent()
                                        HStack{
                                            Text(jamu.name)
                                                .bold()
                                                .font(JFont.semiBold(fontFamily: .poppins, size: 24))
                                            Rectangle()
                                                .fill(JColor.gradientPurple)
                                                .cornerRadius(20)
                                                .frame(width: 86, height: 33)
                                                .overlay(

                                            Text("Epic")
                                                .font(JFont.semiBold(fontFamily: .poppins,size: 14))
                                                .foregroundColor(.white)

                                            )

                                        }
                                        Spacer()
                                            .frame(height: ViewPadding.small)


                                        Spacer()
                                            .frame(height: ViewPadding.small)
                                        Group{
                                            Text("Earn 20 XP for each wish made and level up to the next value stage of your stone!")
                                                .lineSpacing(8)
                                                .padding(.horizontal,ViewPadding.xxlarge)
                                                .font(JFont.regular(fontFamily: .poppins,size: 12))
                                                .multilineTextAlignment(.center)

                                            Text("Tangerine Apple")
                                                .font(JFont.semiBold(fontFamily: .poppins, size: 40))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal, ViewPadding.xlarge)
                                            Text("Lemonade Juice")
                                                .font(JFont.regular(fontFamily: .poppins, size: 15))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal, ViewPadding.xlarge)
                                            
                                            Text("12")
                                                .font(JFont.bold(fontFamily: .poppins, size: 30))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal, ViewPadding.xlarge)

                                            Text("About Product")
                                                .font(JFont.semiBold(fontFamily: .poppins, size: 25))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal, ViewPadding.xlarge)
                                            Text("Earn 20 XP for each wish made and level up to the next value stage of your stone!")
                                                .lineSpacing(8)
                                                .padding(.horizontal,ViewPadding.xxlarge)
                                                .font(JFont.regular(fontFamily: .poppins,size: 12))
                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                                .frame(height: ViewPadding.mini)
                                            Image("soon_stone")
                                        }






                                        Spacer()


                                    }
                                }


                            })
                        ).ignoresSafeArea()
                    //                    Spacer()

                }.frame(width: geo.size.width, height: .infinity)
                
                
                
            }
            
        }
        
        
    }
}

struct JamuDetailsWWView_Previews: PreviewProvider {
    static var previews: some View {
        JamuDetailsWW(jamu: jamuJahe)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
