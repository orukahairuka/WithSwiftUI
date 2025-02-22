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
            let bearSize = min(screenWidth, screenHeight) * 0.4 // クマのサイズ

            ZStack {
                Image("IPhone")
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenWidth, height: screenHeight) // 画面の1.5倍に拡大


                BearView(size: bearSize) // クマをコンポーネント化
                    .frame(width: bearSize, height: bearSize)
                    .padding(.top, screenHeight * 0.1) // 位置調整
            }
            .frame(width: screenWidth, height: screenHeight)


        }
    }
}
