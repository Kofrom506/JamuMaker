//import SwiftUI
//import Foundation
//
//struct Test: View {
//
//    @State private var font: Font?
//
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//                .font(JFont.thin(fontFamily: .poppins))
////                .font(getFont(fontType: "AlphaFlowers"))
//
//        }
//        .task {
////            getFont()
//        }
//    }
//
//    func getFont(fontType: String, fontSize: CGFloat = 14, fontWeight: Font.Weight = .regular) -> Font {
//        var font: Font = Font.system(size: fontSize).weight(.thin)
//        
//        let cfURL = Bundle.main.url(forResource: fontType, withExtension: "ttf")! as CFURL
//
//        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
//
//        let uiFont = UIFont(name: fontType, size:  fontSize)
//
//        font = Font(uiFont ?? UIFont())
//        return font
//    }
//}
//
//
//struct Test_Previews: PreviewProvider {
//    static var previews: some View {
//        Test()
//            .previewInterfaceOrientation(.landscapeLeft)
//    }
//}
