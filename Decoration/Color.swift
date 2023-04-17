//
//  Color.swift
//  jamuMaking
//
//  Created by Evan Susanto on 08/04/23.
//

import Foundation
import SwiftUI

public struct JColor {
    /// rgba(25, 28, 50, 1) #191C32
    public static let black = Color("black")
    /// rgba(255, 255, 255, 1) #FFFFFF
    public static let white = Color("white")
    
    /// rgba(247, 147, 26, 1) #F7931A
    public static let orange = Color("orange")
    /// rgba(255, 228, 195, 1) #FFE4C3
    public static let orangeSoft = Color("orangeSoft")
    /// rgba(255, 235, 228, 1) #FFEBE4
    public static let orangePastel = Color("orangePastel")
    
    /// rgba(71, 163, 72, 1) #47A348
    public static let green = Color("green")
    /// rgba(114, 194, 116, 1) #72C274
    public static let greenSoft = Color("greenSoft")
    /// rgba(200, 235, 202, 1) #C8EBCA
    public static let greenPastel = Color("greenPastel")
    
    /// rgba(240, 64, 134, 1) #F04086
    public static let pink = Color("pink")
    /// rgba(255, 155, 179, 1) #FF9BB3
    public static let pinkSoft = Color("pinkSoft")
    /// rgba(255, 228, 239, 1) #FFE4EF
    public static let pinkPastel = Color("pinkPastel")
    
    /// rgba(137, 119, 200, 1) #8977C8
    public static let purple = Color("purple")
    /// rgba(159, 157, 243, 1) #9F9DF3
    public static let purpleSoft = Color("purpleSoft")
    /// rgba(231, 229, 253, 1) #E7E5FD
    public static let purplePastel = Color("purplePastel")
    
    /// rgba(62, 127, 245, 1) #3E7FF5
    public static let blue = Color("blue")
    /// rgba(102, 182, 255, 1) #66B6FF
    public static let blueSoft = Color("blueSoft")
    /// rgba(223, 240, 255, 1) #DFF0FF
    public static let bluePastel = Color("bluePastel")
    
    /// Grey #9395A4
    public static let grey = Color("grey")
    
    /// White For Card Background #F7F7FA
    public static let white_card_bg = Color("white_card_bg")
    public static let white_level_progress =  Color("white_level_progress")
    
    public static let purpleBackground = Color("purpleBackground")
    
    public static let orangePastelNew = Color("orangePastelNew")
    public static let orangeSeconder = Color("orangeSeconder")
    
    public static let yellow = Color("yellow")
    public static let yellowSoft = Color("yellowSoft")
    
    
    public static let gradientPurple = LinearGradient(colors: [Color("purple1gradient"), Color("purple2gradient")], startPoint: .top, endPoint: .bottom)
    
    public static let gradientCard = LinearGradient(colors: [Color("purple1gradient"), Color("purple2gradient")], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    public static let gradientGreenBG = LinearGradient(colors: [Color("green"), Color("greenSoft"),Color("greenPastelNew")], startPoint: .top, endPoint: .bottom)
    
    public static let gradientOrangeBG = LinearGradient(colors: [Color("orange"), Color("orangeSeconder"),Color("orangePastelNew")], startPoint: .top, endPoint: .bottom)
    
    public static let gradientRedBG = LinearGradient(colors: [Color("red"), Color("redSeconder"),Color("redPastelNew")], startPoint: .top, endPoint: .bottom)

    public static let gradientGreenCardBG = LinearGradient(colors: [Color("green1gradient"), Color("green2gradient")], startPoint: .leading, endPoint: .trailing)
    public static let gradientPinkCardBG = LinearGradient(colors: [Color("pink1gradient"), Color("pink2gradient")], startPoint: .leading, endPoint: .trailing)
    
    
    public static let gradientRedLeftRight = LinearGradient(colors: [Color("redPastelNew"), Color("redSeconder"), Color("red")], startPoint: .leading, endPoint: .trailing)
    public static let gradientGreenLeftRight = LinearGradient(colors: [Color("greenPastelNew"), Color("greenSoft"), Color("green")], startPoint: .leading, endPoint: .trailing)
}

