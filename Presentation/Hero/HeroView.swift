//
//  HeroView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct HeroView: View {
    @State var showImage: Bool = true
    @State private var isTapped = false
    @State var jamuClicked: Jamu? = nil
    @State var effect: Int = 0
    var user: User = User(
        name: "Evan Susanto",
        inventoryIngridient: ["Tamarind": 0, "Rice": 0, "Chili": 0, "Salt": 0, "Palm Sugar": 0, "Ginger": 0, "Cinnamon": 0, "Galangal": 0, "Turmeric": 0, "Honey": 0, "Andrographis": 0, "Lemongrass": 0, "Betel Leaf": 0, "Curcuma": 0],
        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih": 0, "Temulawak": 0, "Zonk": 0]
    )
    
    @State var health: Int = 0
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("background_keraton")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                HStack{
                    VStack{
                        ProgressBar(colorProgress: Color.red, colorBackground: JColor.white_level_progress, value: $health, maxValue: 100)
                        Button("Press") {
                            self.health-=20
                        }
                        Text("Press")
                        HStack{
                            Image(isTapped ? "girl_happy" : "girl_sick_severe")
                                .resizable()
                                .transition(.opacity)
                                .scaledToFit()
                            //                            Image(jamuClicked ?? jamuClicked.imageName : "" )
                            
                            Image("jamuClicked == nil ?  jamuClicked.imageName : ")
                                .resizable()
                                .transition(.opacity)
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.3)
                                .onTapGesture {
                                    if jamuClicked != nil{
                                        if(self.health>0 && self.health < 100){
                                            switch jamuClicked!.rarity{
                                            case .epic:
                                                self.health+=20
                                                withAnimation {
                                                    self.isTapped.toggle()
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                        self.isTapped.toggle()
                                                    }
                                                    
                                                }
                                            case .rare:
                                                self.health+=10
                                                withAnimation {
                                                    self.isTapped.toggle()
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                        self.isTapped.toggle()
                                                    }
                                                    
                                                }
                                            case .common:
                                                self.health+=5
                                                withAnimation {
                                                    self.isTapped.toggle()
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                        self.isTapped.toggle()
                                                    }
                                                    
                                                }
                                            case .zonk:
                                                self.health-=20
                                                withAnimation {
                                                    self.isTapped.toggle()
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                        self.isTapped.toggle()
                                                    }
                                                    
                                                }
                                            }
                                        }}
                                    
                                }
                        }
                        
                    }
                    Spacer()
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 40){
                            ForEach(user.inventoryJamu.sorted(by: <), id: \.key) { key, value  in
                                switch key {
                                case "Beras Kencur":
                                    JamuCardView(jamu: jamuBerasKencur, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuBerasKencur
                                            }
                                        }
                                case "Cabe Puyang":
                                    JamuCardView(jamu: jamuCabePuyang, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuCabePuyang
                                            }
                                        }
                                case "Empon-Empon":
                                    JamuCardView(jamu: jamuEmpon, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuEmpon
                                            }
                                        }
                                case "Jahe":
                                    JamuCardView(jamu: jamuJahe, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuJahe
                                            }
                                        }
                                case "Jakutes":
                                    JamuCardView(jamu: jamuJakutes, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuJakutes
                                            }
                                        }
                                case "Kayu Manis":
                                    JamuCardView(jamu: jamuKayuManis, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuKayuManis
                                            }
                                        }
                                case "Kunyit Asam":
                                    JamuCardView(jamu: jamuKunyitAsam, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuKunyitAsam
                                            }
                                        }
                                case "Kunyit Madu":
                                    JamuCardView(jamu: jamuKunyitMadu, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuKunyitMadu
                                            }
                                        }
                                case "Sambiloto":
                                    JamuCardView(jamu: jamuSambiloto, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuSambiloto
                                            }
                                        }
                                case "Sirih":
                                    JamuCardView(jamu: jamuSirih, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuSirih
                                            }
                                        }
                                case "Temulawak":
                                    JamuCardView(jamu: jamuTemulawak, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuTemulawak
                                            }
                                        }
                                case "Zonk":
                                    JamuCardView(jamu: jamuZonk, count: value, withCount: true, onPressed: false,forHeroView: true)
                                        .onTapGesture {
                                            if(value>0){
                                                jamuClicked = jamuZonk
                                            }
                                        }
                                    
                                default:
                                    IngridientCardView(ingridient: bahanError, count: value)
                                }
                                
                            }
                            
                            
                        }.frame(maxWidth: geo.size.width*0.13, maxHeight : .infinity)
                        
                        
                    }
                    
                }.padding(.horizontal, ViewPadding.medium)
                VStack{
                    Spacer()
                    HStack{
                        
                        NavigatePage(image: "button_almanac", destination: .almanac, geo: geo)
                        Spacer()
                        NavigatePage(image: "button_gather", destination: .map, geo: geo)
                    }.padding(.horizontal, ViewPadding.large)
                        .padding(.trailing, geo.size.width * 0.12)
                }
            }
            
        }
        .onAppear{
            onAppear()
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                withAnimation {
                    showImage.toggle()
                }
            }
            
        }
    }
}

extension HeroView {
    
    func damaged() {
        //        placeHerbRandomly(in: size)
        //        Timer.scheduledTimer(withTimeInterval: vm.timerInterval, repeats: true) { _ in
        //            updateHerb()
        //        }
        
    }
    
    
    private func onAppear() {
        Task {
            self.health = user.health
            
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

