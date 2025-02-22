//
//  LvOneIPhoneView.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/15.
//

import SwiftUI

struct LvOneIPhoneView: View {
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height

            HStack {
                Spacer()
                ZStack {
                    // 顔
                    Circle()
                        .fill(Color.brown)
                        .frame(width: 350, height: 350)

                    // 耳（左）
                    Circle()
                        .fill(Color.brown)
                        .frame(width: 120, height: 120)
                        .offset(x: -120, y: -120)

                    // 耳（右）
                    Circle()
                        .fill(Color.brown)
                        .frame(width: 120, height: 120)
                        .offset(x: 120, y: -120)

                    // 目（左）
                    Circle()
                        .fill(Color.black)
                        .frame(width: 60, height: 60)
                        .offset(x: -60, y: -40)

                    // 目（右）
                    Circle()
                        .fill(Color.black)
                        .frame(width: 60, height: 60)
                        .offset(x: 60, y: -40)

                    // 口（微笑みの曲線）
                    Path { path in
                        let startX: CGFloat = -40
                        let endX: CGFloat = 40
                        let controlY: CGFloat = 120

                        path.move(to: CGPoint(x: startX, y: 80))
                        path.addQuadCurve(to: CGPoint(x: endX, y: 80), control: CGPoint(x: 0, y: controlY))
                    }
                    .stroke(Color.black, lineWidth: 5)
                    .offset(x: 200, y:180)
                }
                .frame(width: 400, height: 400)
                .padding(.top, 200)
                Spacer()
            }

        }
    }
}

#Preview {
    LvOneIPhoneView()
}
