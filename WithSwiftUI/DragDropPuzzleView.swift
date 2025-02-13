//
//  ContentView.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/11.
//

import SwiftUI

struct DragDropPuzzleView: View {
    @State private var wordPosition: CGPoint = CGPoint(x: 50, y: 300)
    let targetPosition = CGPoint(x: 200, y: 300)

    var body: some View {
        ZStack {
            // 正しい位置を示すガイド
            Text("_____")
                .font(.largeTitle)
                .position(targetPosition)
                .foregroundColor(.gray)

            // ドラッグ可能な単語
            Text("Color")
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
                            if distance(from: wordPosition, to: targetPosition) < 30 {
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

