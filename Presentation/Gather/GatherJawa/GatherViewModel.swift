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
    
    
    func startGame(size: CGSize) {
        placeHerbRandomly(in: size)
        Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true) { _ in
            self.updateHerb()
        }

    }

    func placeHerbRandomly(in size: CGSize) {
        ingridients_temp.indices.forEach { index in
            var ingridient = ingridients[index]
            ingridient.position = CGPoint(x: CGFloat.random(in: 0..<size.width * 2/3), y: CGFloat.random(in: 0..<size.height * 1/4))
            ingridients_temp[index] = ingridient
        }
    }

    func updateHerb() {
        let randomIndex = Int.random(in: 0..<ingridients_temp.count)
        ingridients_temp[randomIndex].isUp.toggle()
    }

    func endGame() {
        ingridients_temp.removeAll()
    }
}


