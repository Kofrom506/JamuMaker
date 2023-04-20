//
//  ScreenRouter.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import Foundation
import SwiftUI

enum ScreenRoute: ScreenProtocol {
    case home
    case hero
    case jamu
    case gather
    case almanac
    case map
    case onBoarding
    
    
    var embedInNavView: Bool {
        switch self {
        case .home:
            return true
        case .jamu, .hero, .map, .gather, .almanac, .onBoarding:
            return false
       
        }
    }
}

class ScreenRouterFactory: RouterFactory {
    @ViewBuilder func makeBody(for screen: ScreenRoute) -> some View {
        switch screen {
        case .home:
            HomeView()
        case .hero:
            HeroView()
        case .jamu:
            JamuView(vm: JamuViewModel())
        case .gather:
            GatherView(vm: GatherViewModel())
        case .almanac:
            AlmanacView()
        case .map:
            MapView()
        case .onBoarding:
            OnboardingView()
        }
        
    }
}

typealias ScreenRouter = Router<ScreenRoute, ScreenRouterFactory>

struct MainView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    var body: some View {
        screenRouter.start()
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
