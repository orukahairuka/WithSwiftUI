//
//  LvOneView.swift
//  WithSwiftUI
//
//  Created by 櫻井絵理香 on 2025/02/15.
//

import SwiftUI

struct LvOneView: View {
    var body: some View {
        HStack {
            LvOneCodeView()
                .padding()
            Divider()
            LvOneIPhoneView()
                .padding()
        }
    }
}

#Preview {
    LvOneView()
}
