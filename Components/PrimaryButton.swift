//
//  SwiftUIView.swift
//  
//
//  Created by Evan Susanto on 20/04/23.
//

import SwiftUI



struct PrimaryButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let strokeColor: Color
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
                    .stroke(strokeColor, lineWidth: 1)
        )
            .font(JFont.bold(size: 16))
            .shadow(color: JColor.black.opacity(0.25), radius: 4, x: 0, y: 4)
    }
}

struct PrimaryButton: View {
    
    private static let buttonHorizontalMargins: CGFloat = 0
    
    var backgroundColor: Color
    var foregroundColor: Color
    var strokeColor: Color
    
    private let title: String
    private let action: () -> Void
    private let disabled: Bool
    
    init(title: String,
         disabled: Bool = false,
         backgroundColor: Color = JColor.purpleSoft,
         foregroundColor: Color = JColor.white,
         strokeColor: Color = JColor.purpleSoft,
         action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.strokeColor = strokeColor
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
                                            foregroundColor: foregroundColor, strokeColor: strokeColor,
                                          isDisabled: disabled))
                .disabled(self.disabled)
            Spacer(minLength: PrimaryButton.buttonHorizontalMargins)
        }
        .frame(maxWidth:.infinity)
    }
}
