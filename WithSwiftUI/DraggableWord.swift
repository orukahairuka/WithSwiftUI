//
//  DraggableWord.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/15.
//

import SwiftUI

struct DraggableWord: View {
    @State private var wordPosition: CGPoint
    let targetPosition: CGPoint
    let word: String

    init(word: String, wordPosition: CGPoint, targetPosition: CGPoint) {
        self.word = word
        self._wordPosition = State(initialValue: wordPosition)
        self.targetPosition = targetPosition
    }

    var body: some View {
        ZStack {
            // 正しい位置を示すガイド
            Text("_____")
                .font(.largeTitle)
                .position(targetPosition)
                .foregroundColor(.gray)

            // ドラッグ可能な単語
            Text(word)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .position(wordPosition)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.wordPosition = gesture.location
                        }
                        .onEnded { _ in
                            // もし近い場所にドロップされたらスナップ
                            if distance(from: wordPosition, to: targetPosition) < 60 {
                                wordPosition = targetPosition
                            }
                        }
                )
        }
    }

    // 距離計算
    func distance(from: CGPoint, to: CGPoint) -> CGFloat {
        sqrt(pow(from.x - to.x, 2) + pow(from.y - to.y, 2))
    }
}
