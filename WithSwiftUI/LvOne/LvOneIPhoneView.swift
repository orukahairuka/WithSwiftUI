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

            ZStack {
                // 顔
                Circle()
                    .fill(Color.brown)
                    .frame(width: 150, height: 150)

                // 耳（左）
                Circle()
                    .fill(Color.brown)
                    .frame(width: 50, height: 50)
                    .offset(x: -60, y: -60)

                // 耳（右）
                Circle()
                    .fill(Color.brown)
                    .frame(width: 50, height: 50)
                    .offset(x: 60, y: -60)

                // 目（左）
                Circle()
                    .fill(Color.black)
                    .frame(width: 20, height: 20)
                    .offset(x: -30, y: -20)

                // 目（右）
                Circle()
                    .fill(Color.black)
                    .frame(width: 20, height: 20)
                    .offset(x: 30, y: -20)

                // 鼻
                Circle()
                    .fill(Color.black)
                    .frame(width: 30, height: 30)
                    .offset(y: 20)

                // 口
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 20, height: 5)
                    .offset(y: 40)
            }
            .frame(width: screenWidth, height: screenHeight)
        }
    }
}

#Preview {
    LvOneIPhoneView()
}
