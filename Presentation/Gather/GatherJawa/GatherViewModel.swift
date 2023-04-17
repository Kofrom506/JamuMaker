//
//  GatherViewModel.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import Foundation

class GatherViewModel: ObservableObject {
    let timerInterval = 1.0
    @Published var ingridients_temp: [Ingredient] = ingridients
}


