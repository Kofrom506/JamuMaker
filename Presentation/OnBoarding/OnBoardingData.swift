//
//  File.swift
//  
//
//  Created by Evan Susanto on 20/04/23.
//

import Foundation
struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let objectImage: String
    let primaryText: String
    let secondaryText: String

    static let list: [OnboardingData] = [
        OnboardingData(id: 0, objectImage: "onboarding_1", primaryText: "Welcome To Jamu Maker", secondaryText: "Welcome to the Jamu Maker application. This application can help you learn and play at the same time how to make jamu, a local herbal drink that is healthy and beneficial"),
        OnboardingData(id: 1, objectImage: "onboarding_2", primaryText: "Main Problems", secondaryText: "The background of this application is my concern that arose when I saw my 10-year-old cousin consuming sugary drinks full of coloring and preservatives excessively. This behavior can lead to several health problem such as diabetes, tooth decay and obesity. In addition, the rate of diabetes among young people in Indonesia has also increased dramatically. So there was a need for a solution"),
        OnboardingData(id: 2, objectImage: "onboarding_3", primaryText: "Introducing Jamu", secondaryText: "Therefore, I would like to invite and introduce them about Jamu, a local herbal drink that is easy to make, inexpensive and has a positive impact on overall body health."),
        OnboardingData(id: 3, objectImage: "girl_sick_severe", primaryText: "The Princess has fallen ill", secondaryText: "Oh no, the daughter of the Majapahit kingdom is seriously ill and is holding a competition for everyone who can cure her illness. The king said that for anyone who can cure this disease will be given a great gift"),
        OnboardingData(id: 4, objectImage: "onboarding_5", primaryText: "Search The Ingredients", secondaryText: "To save the princess, we need to look for ingredients to make herbal medicine which are spread across the Indonesian islands of Sumatra, Java, Kalimantan, Sulawesi and Papua."),
        OnboardingData(id: 5, objectImage: "onboarding_6", primaryText: "Create your own Jamu", secondaryText: "We can then make jamu using the recipe found in the Almanac. Where 3 types of Jamu can be produced, namely epic rare and common. However, if the Jamu that is made does not follow the appropriate recipe, it will produce poisonous Jamu which will have a negative impact"),
        OnboardingData(id: 6, objectImage: "girl_win", primaryText: "Save The Princess", secondaryText: "Let's save the Princess from her illness with the Jamu we made"),
 
    ]
}
