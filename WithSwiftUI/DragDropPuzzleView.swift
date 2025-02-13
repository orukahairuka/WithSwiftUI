//
//  ContentView.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/11.
//

import SwiftUI

struct DragDropPuzzleView: View {
    @State private var wordPositionColor: CGPoint = CGPoint(x: 50, y: 300)
    @State private var wordPositionSwift: CGPoint = CGPoint(x: 50, y: 400)

    let targetPositionColor = CGPoint(x: 200, y: 300)
    let targetPositionSwift = CGPoint(x: 200, y: 400)

    var body: some View {
        ZStack {
            // 正しい位置を示すガイド
            Text("_____") // Colorの場所
                .font(.largeTitle)
                .position(targetPositionColor)
                .foregroundColor(.gray)

            Text("_____") // Swiftの場所
                .font(.largeTitle)
                .position(targetPositionSwift)
                .foregroundColor(.gray)

            // ドラッグ可能な単語1 (Color)
            Text("Color")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .position(wordPositionColor)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.wordPositionColor = gesture.location
                        }
                        .onEnded { _ in
                            // 正しい場所に近ければスナップ、それ以外は元の場所に戻る
                            if distance(from: wordPositionColor, to: targetPositionColor) < 30 {
                                wordPositionColor = targetPositionColor
                            } else {
                                wordPositionColor = CGPoint(x: 50, y: 300) // 元の位置に戻す
                            }
                        }
                )

            // ドラッグ可能な単語2 (Swift)
            Text("Swift")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.red)
                .position(wordPositionSwift)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            self.wordPositionSwift = gesture.location
                        }
                        .onEnded { _ in
                            // 正しい場所に近ければスナップ、それ以外は元の位置に戻る
                            if distance(from: wordPositionSwift, to: targetPositionSwift) < 30 {
                                wordPositionSwift = targetPositionSwift
                            } else {
                                wordPositionSwift = CGPoint(x: 50, y: 400) // 元の位置に戻す
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

