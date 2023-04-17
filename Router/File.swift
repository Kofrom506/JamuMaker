////
////  Font.swift
////  jamuMaking
////
////  Created by Evan Susanto on 08/04/23.
////
//
//import Foundation
//import SwiftUI
//
//public enum JFontFamily {
//    case systemFont
//    case poppins
//    case leagueSpartan
//}
//
//public struct JFont {
//    
//    /// custom thin font.
//    /// - Parameter size: The size of the font. Default value is 14.
//    public static func thin(fontFamily: JFontFamily = .poppins, size: CGFloat = 14) -> Font {
//        var fontType: String = ""
//        var font: Font = Font.system(size: size)
//        
//        switch fontFamily {
//        case .systemFont:
//            font = .system(size: size).weight(.thin)
//        case .poppins:
//            fontType = "Poppins-Thin"
//        case .leagueSpartan:
//            fontType = "LeagueSpartan-Thin"
//        }
//        let cfURL = Bundle.main.url(forResource: fontType, withExtension: "ttf")! as CFURL
//        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
//        let uiFont = UIFont(name: fontType, size:  size)
//        
//        font = Font(uiFont ?? UIFont())
//        return font
//    }
//    
//    /// custom light font.
//    /// - Parameter size: The size of the font. Default value is 14.
//    public static func light(fontFamily: JFontFamily = .poppins, size: CGFloat = 14) -> Font {
//        var fontType: String = ""
//        var font: Font = Font.system(size: size)
//        
//        switch fontFamily {
//        case .systemFont:
//            font = .system(size: size).weight(.light)
//        case .poppins:
//            fontType = "Poppins-Light"
//        case .leagueSpartan:
//            fontType = "LeagueSpartan-Light"
//        }
//        let cfURL = Bundle.main.url(forResource: fontType, withExtension: "ttf")! as CFURL
//        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
//        let uiFont = UIFont(name: fontType, size:  size)
//        
//        font = Font(uiFont ?? UIFont())
//        return font
//        
//    }
//    
//    /// custom regular font.
//    /// - Parameter size: The size of the font. Default value is 14.
//    public static func regular(fontFamily: JFontFamily = .poppins, size: CGFloat = 14) -> Font {
//        var fontType: String = ""
//        var font: Font = Font.system(size: size)
//        
//        switch fontFamily {
//        case .systemFont:
//            font = .system(size: size).weight(.regular)
//        case .poppins:
//            fontType = "Poppins-Regular"
//        case .leagueSpartan:
//            fontType = "LeagueSpartan-Regular"
//        }
//        let cfURL = Bundle.main.url(forResource: fontType, withExtension: "ttf")! as CFURL
//        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
//        let uiFont = UIFont(name: fontType, size:  size)
//        
//        font = Font(uiFont ?? UIFont())
//        return font
//        
//    }
//    
//    /// custom italic font.
//    /// - Parameter size: The size of the font. Default value is 14.
//    public static func italic(fontFamily: JFontFamily = .poppins, size: CGFloat = 14) -> Font {
//        var fontType: String = ""
//        var font: Font = Font.system(size: size)
//        
//        switch fontFamily {
//        case .systemFont:
//            font = .system(size: size).weight(.thin)
//        case .poppins:
//            fontType = "Poppins-Thin"
//        case .leagueSpartan:
//            fontType = "LeagueSpartan-Thin"
//        }
//        let cfURL = Bundle.main.url(forResource: fontType, withExtension: "ttf")! as CFURL
//        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
//        let uiFont = UIFont(name: fontType, size:  size)
//        
//        font = Font(uiFont ?? UIFont())
//        return font
//    }
//    
//    /// custom medium font.
//    /// - Parameter size: The size of the font. Default value is 14.
//    public static func medium(fontFamily: JFontFamily = .poppins, size: CGFloat = 14) -> Font {
//        var fontType: String = ""
//        var font: Font = Font.system(size: size)
//        
//        switch fontFamily {
//        case .systemFont:
//            font = .system(size: size).weight(.medium)
//        case .poppins:
//            fontType = "Poppins-Medium"
//        case .leagueSpartan:
//            fontType = "LeagueSpartan-Medium"
//        }
//        let cfURL = Bundle.main.url(forResource: fontType, withExtension: "ttf")! as CFURL
//        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
//        let uiFont = UIFont(name: fontType, size:  size)
//        
//        font = Font(uiFont ?? UIFont())
//        return font
//        
//        
//    }
//    
//    /// custom semi bold font.
//    /// - Parameter size: The size of the font. Default value is 14.
//    public static func semiBold(fontFamily: JFontFamily = .poppins, size: CGFloat = 14,weight: Font.Weight = .regular) -> Font {
//        var fontType: String = ""
//        var font: Font = Font.system(size: size)
//        
//        switch fontFamily {
//        case .systemFont:
//            font = .system(size: size).weight(.semibold)
//        case .poppins:
//            fontType = "Poppins-SemiBold"
//        case .leagueSpartan:
//            fontType = "LeagueSpartan-SemiBold"
//        }
//        let cfURL = Bundle.main.url(forResource: fontType, withExtension: "ttf")! as CFURL
//        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
//        let uiFont = UIFont(name: fontType, size:  size)
//        
//        font = Font(uiFont ?? UIFont())
//        return font
//        
//        
//    }
//    
//    /// custom bold font.
//    /// - Parameter size: The size of the font. Default value is 14.
//    public static func bold(fontFamily: JFontFamily = .poppins, size: CGFloat = 14) -> Font {
//        var fontType: String = ""
//        var font: Font = Font.system(size: size)
//        
//        switch fontFamily {
//        case .systemFont:
//            font = .system(size: size).weight(.bold)
//        case .poppins:
//            fontType = "Poppins-Bold"
//        case .leagueSpartan:
//            fontType = "LeagueSpartan-Bold"
//        }
//        let cfURL = Bundle.main.url(forResource: fontType, withExtension: "ttf")! as CFURL
//        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
//        let uiFont = UIFont(name: fontType, size:  size)
//        
//        font = Font(uiFont ?? UIFont())
//        return font
//        
//        
//    }
//    
//    ///  custom extra bold font.
//    /// - Parameter size: The size of the font. Default value is 14.
//    public static func extraBold(fontFamily: JFontFamily = .poppins, size: CGFloat = 14) -> Font {
//        var fontType: String = ""
//        var font: Font = Font.system(size: size)
//        
//        switch fontFamily {
//        case .systemFont:
//            font = .system(size: size).weight(.heavy)
//        case .poppins:
//            fontType = "Poppins-ExtraBold"
//        case .leagueSpartan:
//            fontType = "LeagueSpartan-ExtraBold"
//        }
//        let cfURL = Bundle.main.url(forResource: fontType, withExtension: "ttf")! as CFURL
//        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
//        let uiFont = UIFont(name: fontType, size:  size)
//        
//        font = Font(uiFont ?? UIFont())
//        return font
//        
//        
//        
//    }
//    
//    /// custom black font.
//    /// - Parameter size: The size of the font. Default value is 14.
////    public static func black(fontFamily: JFontFamily = .poppins, size: CGFloat = 14) -> Font {
////        switch fontFamily {
////        case .systemFont:
////            return .system(size: size).weight(.black)
////        case .poppins:
////            return .custom("Poppins-Black", size: size)
////        case .leagueSpartan:
////            return .custom("LeagueSpartan-Black", size: size)
////        }
////    }
//}
