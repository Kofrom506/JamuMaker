//
//  HeroView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct HeroView: View {
    @EnvironmentObject var screenRouter:  ScreenRouter
    @EnvironmentObject var user: User
    @State var showImage: Bool = true
    @State private var isTapped = false
    @State var jamuClicked: Jamu? = nil
    @State var isClicked: Bool = false
    @State var isJamuZonk: Bool = false
    @State var isShowingAlert: Bool = false
    @State var textAlert: String = ""
    @State var isLocking: Bool = false
    @State var effect: Int = 0
    
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
                        
                        HStack{
                            if(isTapped){
                                Image("girl_happy" )
                                    .resizable()
                                    .transition(.opacity)
                                    .scaledToFit()
                            }else if(isJamuZonk){
                                Image("girl_spit")
                                    .resizable()
                                    .transition(.opacity)
                                    .scaledToFit()
                            }else if(self.health>=100){
                                Image("girl_healthy")
                                    .resizable()
                                    .transition(.opacity)
                                    .scaledToFit()
                            }
                            else if(self.health<=0){
                                Image("girl_cry")
                                    .resizable()
                                    .transition(.opacity)
                                    .scaledToFit()
                            }else{
                                Image("girl_sick")
                                    .resizable()
                                    .transition(.opacity)
                                    .scaledToFit()
                            }
                            
                            if(jamuClicked != nil && user.inventoryJamu[jamuClicked!.name]! > 0){
                                
                                Image(jamuClicked!.imageName)
                                    .resizable()
                                    .transition(.opacity)
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.3)
                                    .shadow(color: Color.yellow.opacity(0.5), radius: 10)
                                    .onTapGesture {
                                        if !self.isLocking {
                                            if jamuClicked != nil{
                                                switch jamuClicked!.rarity{
                                                case .epic:
                                                    self.health+=15
                                                    user.health+=15
                                                    if(self.health>=99){
                                                        textAlert = "Congratulation You Have Saved The Princess from the disease 🥹😇🥳 "
                                                        isShowingAlert.toggle()
                                                    }
                                                    withAnimation {
                                                        self.isLocking = true
                                                        self.isTapped.toggle()
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                            self.isTapped.toggle()
                                                            self.isLocking = false
                                                        }
                                                        
                                                    }
                                                case .rare:
                                                    self.health+=10
                                                    user.health+=10
                                                    if(self.health>=99){
                                                        textAlert = "Congratulation You Have Saved The Princess from the disease 🥹😇🥳 "
                                                        isShowingAlert.toggle()
                                                    }
                                                    withAnimation {
                                                        self.isLocking = true
                                                        self.isTapped.toggle()
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                            self.isTapped.toggle()
                                                            self.isLocking = false
                                                        }
                                                        
                                                    }
                                                case .common:
                                                    self.health+=5
                                                    user.health+=5
                                                    if(self.health>=99){
                                                        textAlert = "Congratulation You Have Saved The Princess from the disease 🥹😇🥳 "
                                                        isShowingAlert.toggle()
                                                    }
                                                    withAnimation {
                                                        self.isLocking = true
                                                        self.isTapped.toggle()
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                            self.isTapped.toggle()
                                                            self.isLocking = false
                                                        }
                                                        
                                                    }
                                                case .zonk:
                                                    self.health-=20
                                                    user.health-=20
                                                    
                                                    if(self.health <= 0){
                                                        textAlert = "Oh no, You failed to save the princess 😭😭😭"
                                                        isShowingAlert.toggle()
                                                        
                                                    }
                                                    withAnimation {
                                                        self.isLocking = true
                                                        self.isJamuZonk.toggle()
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                            self.isJamuZonk.toggle()
                                                            self.isLocking = false
                                                        }
                                                        
                                                    }
                                                }
                                                
                                                //                                                if(self.health>=99){
                                                //                                                    textAlert = "Congratulation You Have Saved The Princess from the disease 🥹😇🥳 "
                                                //                                                    isShowingAlert.toggle()
                                                //                                                }
                                                //                                                    else if(self.health<=1){
                                                //                                                    textAlert = "Oh no, You failed to save the princess 😭😭😭"
                                                //                                                    isShowingAlert.toggle()
                                                //                                                }
                                                
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                                user.inventoryJamu[jamuClicked!.name]!-=1
                                            }
                                        }
                                        
                                        
                                        isClicked.toggle()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            self.isClicked.toggle()
                                            
                                        }
                                    }
                                    .rotationEffect(isClicked ? Angle(degrees: -45) : Angle(degrees: 0))
                                    .alert(isPresented: $isShowingAlert) {
                                            Alert(title: Text("Restart Game"), message: Text(textAlert), dismissButton: .default(Text("Restart"), action: {
                                                self.health = 25
                                                user.health = 25
                                            }))
                                        }
//                                    .alert(isPresented: $isShowingAlert) {
//                                        Alert(title: Text("Restart Game"), message: Text("You must acknowledge this message by clicking the OK button."), primaryButton: .default(Text("Restart"), action: {
//                                            self.health = 25
//                                            user.health = 25
//                                        }))
                                        //                                        Alert(title: Text("Restart"), message: Text(textAlert), primaryButton: .default(Text("Restart"), action: {
                                        //
                                        //                                                   }))
                                        
                                        //                                        Button("Restart", role: .cancel) {
                                        //                                            self.health = 25
                                        //                                            user.health = 25
                                        //                                        }
                                    
                                
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

