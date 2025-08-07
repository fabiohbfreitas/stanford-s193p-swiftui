//
//  Cardify.swift
//  Memorize
//
//  Created by Fabio Freitas on 06/08/25.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        let baseShape = RoundedRectangle(cornerRadius: Constants.cornerRadius)
        ZStack {
            baseShape
                .stroke(style: StrokeStyle(lineWidth: Constants.lineWidth))
                .background(baseShape.fill(.white.gradient))
                .foregroundStyle(.orange)
                .overlay(
                    content
                )
                .opacity(isFaceUp ? 1 : 0)
            baseShape
                .stroke(style: StrokeStyle(lineWidth: Constants.lineWidth))
                .background(baseShape
                    .opacity(Constants.backgroundShade))
                .foregroundStyle(.orange.gradient)
                .opacity(isFaceUp ? 0 : 1)
        }
        
    }
}

extension Cardify {
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let backgroundShade: CGFloat = 0.9
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
