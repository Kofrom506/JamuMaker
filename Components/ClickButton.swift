//
//  ClickButton.swift
//  jamuMaking
//
//  Created by Evan Susanto on 08/04/23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(currentForegroundColor, lineWidth: 1)
        )
            .padding()
            .font(Font.custom("Poppins-Bold", size: 16))
    }
}

struct PrimaryButton: View {
    
    private static let buttonHorizontalMargins: CGFloat = 0
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let title: String
    private let action: () -> Void
    private let disabled: Bool
    
    init(title: String,
         disabled: Bool = false,
         backgroundColor: Color = JColor.purpleSoft,
         foregroundColor: Color = Color.white,
         action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.action = action
        self.disabled = disabled
    }
    
    var body: some View {
        HStack {
            Spacer(minLength: PrimaryButton.buttonHorizontalMargins)
            Button(action:self.action) {
                Text(self.title)
                    .frame(maxWidth:.infinity)
            }
            .buttonStyle(PrimaryButtonStyle(backgroundColor: backgroundColor,
                                          foregroundColor: foregroundColor,
                                          isDisabled: disabled))
                .disabled(self.disabled)
            Spacer(minLength: PrimaryButton.buttonHorizontalMargins)
        }
        .frame(maxWidth:.infinity)
    }
}


struct PrimaryButton_Previews: PreviewProvider {
    
    func test() -> Void {
        print("Evan")
    }
    
    static var previews: some View {
        PrimaryButton(title: "Delay The Purchase",backgroundColor: JColor.greenPastel,foregroundColor: .red) {
            print("Delay The Purchase")
        }
    }
}

