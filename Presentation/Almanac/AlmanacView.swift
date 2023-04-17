//
//  AlmanacView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct AlmanacView: View {
    @State var jamuClicked: Jamu = jamuBerasKencur
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack {
                    HStack(spacing: 0){
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 40){
                                ForEach(ingridients) { ingridient  in
                                    IngridientCardView(ingridient: ingridient)
                                }
                            }.frame(maxWidth: 150, maxHeight : .infinity)
                            
                    
                        }
                        Spacer()
                            .frame(width: 10)
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 40){
                                ForEach(jamus) { jamu  in
                                    JamuCardView(jamu: jamu)
                                        .onTapGesture {
                                            jamuClicked = jamu
                                        }
                                }
                            }.frame(maxWidth: 150, maxHeight : .infinity)
                            
                    
                        }
                        Spacer()
                        JamuDetailsWW(jamu: jamuClicked)
                    }
                }
                VStack{
                    Spacer()
                    HStack{
                        NavigatePage(image: "button_brew", destination: .jamu, geo: geo)
                        
                        Spacer()
                        NavigatePage(image: "button_save", destination: .hero, geo: geo)
                    }.padding(.horizontal, ViewPadding.xlarge)
                }
            }
        }
    }
    
}
struct AlmanacView_Previews: PreviewProvider {
    static var previews: some View {
        AlmanacView()
            .previewInterfaceOrientation(.landscapeLeft)
        
    }
}
