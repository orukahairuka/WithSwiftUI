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

    init(word: String, startPosition: CGPoint, targetPosition: CGPoint) {
        self.word = word
        self._position = State(initialValue: startPosition)
        self.targetPosition = targetPosition
    }

    var body: some View {
        Text(word)
            .font(.largeTitle)
            .bold()
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
    let words: [(word: String, target: CGPoint)] = [
        ("Color", CGPoint(x: 200, y: 300)),
        ("Swift", CGPoint(x: 200, y: 400)),
        ("View", CGPoint(x: 200, y: 500)),
        ("Frame", CGPoint(x: 200, y: 600))
    ]

    var body: some View {
        ZStack {
            // 正しい位置を示すガイド
            ForEach(words, id: \.word) { wordData in
                Text("_____")
                    .font(.largeTitle)
                    .position(wordData.target)
                    .foregroundColor(.gray)
            }

            // ドラッグ可能な単語
            ForEach(words, id: \.word) { wordData in
                DraggableWord(
                    word: wordData.word,
                    startPosition: CGPoint(x: wordData.target.x - 150, y: wordData.target.y),
                    targetPosition: wordData.target
                )
            }
        }
    }
}

