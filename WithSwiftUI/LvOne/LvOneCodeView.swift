//
//  LvOneCodeView.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/15.
//

import SwiftUI

struct LvOneCodeView: View {
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height

            ZStack {
                DraggableWord(
                    word: "Color",
                    wordPosition: CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.8),
                    targetPosition: CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.3)
                )
                DraggableWord(
                    word: "Blue",
                    wordPosition: CGPoint(x: screenWidth * 0.7, y: screenHeight * 0.8),
                    targetPosition: CGPoint(x: screenWidth * 0.7, y: screenHeight * 0.3) 
                )
            }
        }
    }
}

#Preview {
    LvOneCodeView()
}
