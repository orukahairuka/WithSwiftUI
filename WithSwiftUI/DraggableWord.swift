//
//  DraggableWord.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/15.
//

import SwiftUI

struct DraggableWord: View {
    @State private var wordPosition: CGPoint
    let initialPosition: CGPoint // 元の位置を保持
    let targetPosition: CGPoint
    let word: String
    @Binding var correctWords: [String: Bool]

    init(word: String, initialPosition: CGPoint, targetPosition: CGPoint, correctWords: Binding<[String: Bool]>) {
        self.word = word
        self.initialPosition = initialPosition
        self._wordPosition = State(initialValue: initialPosition)
        self.targetPosition = targetPosition
        self._correctWords = correctWords
    }

    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height

            let isCorrect = correctWords[word] ?? false // 正解状態を Binding から取得

            ZStack {
                // 正解のスロット
                Text("_____")
                    .font(.largeTitle)
                    .position(targetPosition)
                    .foregroundColor(.gray)

                // 単語
                Text(word)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(isCorrect ? .green : .blue) // 正解なら色変更
                    .position(wordPosition)
                    .gesture(
                        isCorrect ? nil : // 正解の単語だけジェスチャーを無効化
                        DragGesture()
                            .onChanged { gesture in
                                self.wordPosition = gesture.location
                            }
                            .onEnded { _ in
                                if distance(from: wordPosition, to: targetPosition) < 60 {
                                    // 正解の場合 → 固定して記録
                                    wordPosition = targetPosition
                                    correctWords[word] = true
                                } else {
                                    // 間違った場合 → 元の位置に戻す
                                    withAnimation {
                                        wordPosition = initialPosition
                                    }
                                }
                            }
                    )

                // 正解メッセージ表示
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

    // 2点間の距離を計算
    func distance(from: CGPoint, to: CGPoint) -> CGFloat {
        sqrt(pow(from.x - to.x, 2) + pow(from.y - to.y, 2))
    }
}
