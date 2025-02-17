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
                Image("IPhone")
                    .resizable()
                    .scaledToFill()
                    .frame(width: screenWidth * 0.85, height: screenHeight * 0.85)
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: screenWidth * 0.5, height: screenHeight * 0.5)
            }
            .frame(width: screenWidth, height: screenHeight)
        }
    }
}

#Preview {
    LvOneIPhoneView()
}
