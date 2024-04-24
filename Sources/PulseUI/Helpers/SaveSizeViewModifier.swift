//
//  StoreSizeViewModifier.swift
//  PulseUI
//
//  Created by Théo Brouillé on 25/04/2024.
//  Copyright © 2024 kean. All rights reserved.
//

import SwiftUI

private struct SaveSizeViewModifier: ViewModifier {
    @Binding var size: CGSize

    func body(content: Content) -> some View {
        content
            .background(sizeReader)
    }

    var sizeReader: some View {
        GeometryReader { proxy in
            Spacer()
                .onAppear {
                    size = proxy.size
                }
        }
    }
}

extension View {
    func saveSize(in size: Binding<CGSize>) -> some View {
        modifier(SaveSizeViewModifier(size: size))
    }
}
