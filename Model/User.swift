//
//  User.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import Foundation


class User: ObservableObject{
    @Published var name: String
    @Published var health: Int
    @Published var level: Int
    @Published var inventoryIngridient: Dictionary<String, Int>
    @Published var inventoryJamu: Dictionary<String, Int>
    @Published var userLocation: Location
    
    
    init(name: String, health: Int = 25, level: Int = 0, inventoryIngridient: Dictionary<String, Int>, inventoryJamu: Dictionary<String, Int>, userLocation: Location = .jawa) {
        self.name = name
        self.health = health
        self.level = level
        self.inventoryIngridient = inventoryIngridient
        self.inventoryJamu = inventoryJamu
        self.userLocation = userLocation
       
    }
    
    func drink(effect: Int) {
        self.health += effect
    }
    
    func levelUp(){
        if(health>=20){
            self.level+=1
            self.health = 10
        }
    }
    
    func isHealthy() -> Bool{
        if(health == 100){
            return true
        }else{
            return false
        }
    }
    
    func isDead() -> Bool{
        if(health == 0){
            return true
        }else{
            return false
        }
    }
}


