//
//  SwiftUIView.swift
//  
//
//  Created by Evan Susanto on 20/04/23.
//

import SwiftUI

struct OnboardingView: View {
//    var data: OnboardingData
    @EnvironmentObject var screenRouter: ScreenRouter
    @State private var currentStep = 0
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                JColor.white.ignoresSafeArea(.all)
                
                
                VStack {
                    GeometryReader { geo in
                        TabView (selection: $currentStep) {
                            ForEach(OnboardingData.list) { it in
                                VStack {
                                    ZStack {
                                        Image(it.objectImage)
                                            .resizable()
                                            .scaledToFit()
                                    }
                                    .frame(width: geo.size.width, height: geo.size.height * 0.6, alignment: .center)
                                    .background(
                                        ZStack(alignment: .top) {
                                            
                                            JColor.greenSoft.ignoresSafeArea(.all)
                                          
                                            
//                                            Image("leaves_bg")
//                                                .resizable()
//                                                .scaledToFit()
//                                                .blendMode(.softLight)
//                                                .ignoresSafeArea(edges: .top)
                                        }
                                    )
                                    .mask(Ellipse().scale(2).position(x: geo.size.width / 2, y: geo.size.height * 0))
                                    .padding(.bottom, ViewPadding.medium)
                                    .edgesIgnoringSafeArea(.top)
            
                                    VStack (spacing: 0) {
                                        Text(it.primaryText)
                                            .font(JFont.semiBold(size: 30))
                                            .foregroundColor(JColor.black)
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, ViewPadding.medium)
                                            .padding(.horizontal, ViewPadding.xmedium)
                                        
                                        Text(it.secondaryText)
                                            .font(JFont.regular(fontFamily: .leagueSpartan,size: 20))
                                            .foregroundColor(JColor.black)
                                            .lineSpacing(ViewPadding.small)
                                            .multilineTextAlignment(.center)
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, ViewPadding.medium)
                                            .padding(.horizontal, ViewPadding.xmedium)
                                    }
                                    .padding(.horizontal)
                                    
                                    Spacer()
                                }
                                .tag(it)
                                
                            }
                            .ignoresSafeArea()
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .onAppear {
                              setupAppearance()
                            }
                        .padding(.bottom, -20)
                        
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                    
                    PrimaryButton(title: currentStep < OnboardingData.list.count - 1 ? "Continue" : "Save The Princess", backgroundColor: JColor.greenSoft, foregroundColor: .white,strokeColor: .white){
                        if self.currentStep < OnboardingData.list.count - 1 {
                            self.currentStep += 1
                        } else {
                            screenRouter.navigateTo(.map)
                        }
                    }
                    .padding(.vertical, ViewPadding.small)
                    .padding(.horizontal, ViewPadding.xmedium)
                    
                    Button {
                        self.currentStep = OnboardingData.list.count - 1
                    } label: {
                        Text("Skip")
                            .font(JFont.regular())
                            .foregroundColor(JColor.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, ViewPadding.small)
                            
                    }
                    .padding(.horizontal, ViewPadding.xmedium)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
        }
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
