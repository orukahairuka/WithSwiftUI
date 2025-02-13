//
//  ContentView.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/11.
//

import SwiftUI



struct LvOneWordView: View {
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
        LvOneWordView()
    }
}
