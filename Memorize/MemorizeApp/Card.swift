//
//  Card.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

struct Card: View {
    let emoji = "👻"
    let isFaceUP: Bool
    
    var body: some View {
        ZStack {
            if isFaceUP {
                RoundedRectangle(cornerRadius: 12.0)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 12.0)
                    .stroke(style: StrokeStyle(lineWidth: 6))
                Text(emoji)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12.0)
                    .stroke(style: StrokeStyle(lineWidth: 6))
            }
        }
    }
}


#Preview {
    VStack {
        Card(isFaceUP: false)
        Card(isFaceUP: true)
    }
}
