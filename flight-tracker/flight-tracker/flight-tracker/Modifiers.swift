//
//  Modifiers.swift
//  flight-tracker
//
//  Created by Enrique Diaz de Leon on 6/9/21.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Baloo2-bold", size: 24))
            .foregroundColor(Color("Swanwhite"))
    }
}

struct Subtitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Baloo2-Bold", size: 20))
            .foregroundColor(Color("ElectronBlue"))
    }
}

struct Label: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Baloo2-Regular", size: 20))
            .foregroundColor(Color("SwanWhite"))
    }
}
