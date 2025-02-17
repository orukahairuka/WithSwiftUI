//
//  Drag.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/13.
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
