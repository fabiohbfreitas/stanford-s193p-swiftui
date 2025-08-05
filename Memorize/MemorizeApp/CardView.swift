//
//  Card.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

struct CardView: View {
    let emoji: String
    @State var isFaceUP: Bool
    
    var body: some View {
        let baseShape = RoundedRectangle(cornerRadius: 12.0)
        ZStack {
            Group {
                baseShape
                    .foregroundStyle(.white)
                baseShape
                    .stroke(style: StrokeStyle(lineWidth: 6))
                Text(emoji)
                    .font(.largeTitle)
            }
            .opacity(isFaceUP ? 1 : 0)
            baseShape
                .stroke(style: StrokeStyle(lineWidth: 6))
                .opacity(isFaceUP ? 0 : 1)
        }
        .onTapGesture {
            isFaceUP.toggle()
        }
    }
}


#Preview {
    VStack {
        CardView(emoji: "👻", isFaceUP: false)
        CardView(emoji: "👻", isFaceUP: true)
    }
    .padding()
}
