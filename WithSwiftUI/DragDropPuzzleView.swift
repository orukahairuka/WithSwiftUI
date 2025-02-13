//
//  ContentView.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/11.
//

import SwiftUI

struct DraggableWord: View {
    @State private var position: CGPoint
    let word: String
    let targetPosition: CGPoint

    init(word: String, startPosition: CGPoint, targetX: CGFloat, targetY: CGFloat) {
        self.word = word
        self._position = State(initialValue: CGPoint(x: targetX - 150, y: targetY)) // 初期位置
        self.targetPosition = CGPoint(x: targetX, y: targetY) // 正解位置
    }

    var body: some View {
        Text(word)
            .bold()
            .font(.largeTitle)
            .foregroundColor(.blue)
            .position(position)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.position = gesture.location
                    }
                    .onEnded { _ in
                        withAnimation {
                            if distance(from: position, to: targetPosition) < 30 {
                                position = targetPosition // スナップ
                            } else {
                                position = CGPoint(x: targetPosition.x - 150, y: targetPosition.y) // 元の位置に戻す
                            }
                        }
                    }
            )
    }

    // 距離計算関数
    func distance(from: CGPoint, to: CGPoint) -> CGFloat {
        sqrt(pow(from.x - to.x, 2) + pow(from.y - to.y, 2))
    }
}

struct DragDropPuzzleView: View {
    let words: [(word: String, targetX: CGFloat, targetY: CGFloat)] = [
        ("Color", 200, 300),
        ("Swift", 250, 400),
        ("View", 300, 500),
        ("Frame", 350, 600)
    ]

    var body: some View {
        ZStack {
            // 正しい位置を示すガイド（空欄の場所）
            ForEach(words, id: \.word) { wordData in
                Text("_____")
                    .bold()
                    .font(.largeTitle)
                    .position(x: wordData.targetX, y: wordData.targetY)
                    .foregroundColor(.gray)
            }

            // ドラッグ可能な単語（それぞれの位置に設定）
            ForEach(words, id: \.word) { wordData in
                DraggableWord(
                    word: wordData.word,
                    startPosition: CGPoint(x: wordData.targetX - 150, y: wordData.targetY),
                    targetX: wordData.targetX,
                    targetY: wordData.targetY
                )
            }
        }
    }
}

struct DragDropPuzzleView_Previews: PreviewProvider {
    static var previews: some View {
        DragDropPuzzleView()
    }
}
