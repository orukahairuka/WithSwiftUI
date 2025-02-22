//
//  BearView.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/22.
//

import SwiftUI

struct BearView: View {
    let size: CGFloat // クマのサイズ

    var body: some View {
        let earSize = size * 0.35
        let eyeSize = size * 0.15
        let mouthYOffset = size * 0.2

        ZStack {
            // 顔
            Circle()
                .fill(Color.brown)
                .frame(width: size, height: size)

            // 耳（左）
            Circle()
                .fill(Color.brown)
                .frame(width: earSize, height: earSize)
                .offset(x: -size * 0.4, y: -size * 0.4)

            // 耳（右）
            Circle()
                .fill(Color.brown)
                .frame(width: earSize, height: earSize)
                .offset(x: size * 0.4, y: -size * 0.4)

            // 目（左）
            Circle()
                .fill(Color.black)
                .frame(width: eyeSize, height: eyeSize)
                .offset(x: -size * 0.2, y: -size * 0.1)

            // 目（右）
            Circle()
                .fill(Color.black)
                .frame(width: eyeSize, height: eyeSize)
                .offset(x: size * 0.2, y: -size * 0.1)

            // 口（微笑みの曲線）
            Path { path in
                let startX: CGFloat = -size * 0.15
                let endX: CGFloat = size * 0.15
                let controlY: CGFloat = size * 0.25

                path.move(to: CGPoint(x: startX, y: mouthYOffset))
                path.addQuadCurve(to: CGPoint(x: endX, y: mouthYOffset), control: CGPoint(x: 0, y: controlY))
            }
            .stroke(Color.black, lineWidth: 5)
        }
    }
}
