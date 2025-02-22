//
//  DraggableWord.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/15.
//

import SwiftUI

struct DraggableWord: View {
    @State private var wordPosition: CGPoint
    @State private var isCorrect = false
    let targetPosition: CGPoint
    let word: String
    @Binding var correctWords: [String: Bool]

    init(word: String, wordPosition: CGPoint, targetPosition: CGPoint, correctWords: Binding<[String: Bool]>) {
        self.word = word
        self._wordPosition = State(initialValue: wordPosition)
        self.targetPosition = targetPosition
        self._correctWords = correctWords
    }

    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height

            ZStack {
                Text("_____")
                    .font(.largeTitle)
                    .position(targetPosition)
                    .foregroundColor(.gray)

                Text(word)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                    .position(wordPosition)
                    .gesture(
                        isCorrect ? nil : // 正解ならジェスチャーを無効化
                        DragGesture()
                            .onChanged { gesture in
                                self.wordPosition = gesture.location
                            }
                            .onEnded { _ in
                                if distance(from: wordPosition, to: targetPosition) < 60 {
                                    wordPosition = targetPosition
                                    correctWords[word] = true
                                    isCorrect = true // 正解状態を記録
                                }
                            }
                    )

                // 正解メッセージ表示（デバッグ用）
                if isCorrect {
                    Text("\(word) 正解！")
                        .font(.title)
                        .foregroundColor(.green)
                        .position(x: screenWidth * 0.5, y: screenHeight * 0.1)
                        .transition(.opacity)
                }
            }
        }
    }

    func distance(from: CGPoint, to: CGPoint) -> CGFloat {
        sqrt(pow(from.x - to.x, 2) + pow(from.y - to.y, 2))
    }
}
