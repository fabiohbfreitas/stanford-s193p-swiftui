//
//  Card.swift
//  Memorize
//
//  Created by Fabio Freitas on 05/08/25.
//

import SwiftUI

struct Card: View {
    let emoji = "👻"
    @State var isFaceUP: Bool
    
    var body: some View {
        let baseShape = RoundedRectangle(cornerRadius: 12.0)
        ZStack {
            if isFaceUP {
                baseShape
                    .foregroundStyle(.white)
                baseShape
                    .stroke(style: StrokeStyle(lineWidth: 6))
                Text(emoji)
                    .font(.largeTitle)
            } else {
                baseShape
                    .stroke(style: StrokeStyle(lineWidth: 6))
            }
        }
        .onTapGesture {
            isFaceUP.toggle()
        }
    }
}


#Preview {
    VStack {
        Card(isFaceUP: false)
        Card(isFaceUP: true)
    }
    .padding()
}
