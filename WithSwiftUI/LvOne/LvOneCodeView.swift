//
//  LvOneCodeView.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/15.
//

import SwiftUI

struct LvOneCodeView: View {
    @State private var correctWords: [String: Bool] = [
        "Color": false,
        "Blue": false
    ]
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height

            VStack {
                ZStack {
                    DraggableWord(
                        word: "Color",
                        wordPosition: CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.8),
                        targetPosition: CGPoint(x: screenWidth * 0.5, y: screenHeight * 0.3),
                        correctWords: $correctWords
                    )
                    DraggableWord(
                        word: "Blue",
                        wordPosition: CGPoint(x: screenWidth * 0.7, y: screenHeight * 0.8),
                        targetPosition: CGPoint(x: screenWidth * 0.7, y: screenHeight * 0.3),
                        correctWords: $correctWords
                    )
                }
                // 全問正解のチェック（すべての値が true なら正解）
                if correctWords.values.allSatisfy({ $0 }) && !correctWords.isEmpty {
                    Text("全問正解！🎉")
                        .font(.title)
                        .foregroundColor(.green)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    LvOneCodeView()
}
