//
//  StoreSizeViewModifier.swift
//  PulseUI
//
//  Created by Théo Brouillé on 25/04/2024.
//  Copyright © 2024 kean. All rights reserved.
//

import SwiftUI

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

private struct OnSizeChangeViewModifier: ViewModifier {
    let action: (CGSize) -> Void

    init(perform action: @escaping (CGSize) -> Void) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content
            .background(sizeView)
            .onPreferenceChange(SizePreferenceKey.self) { size in
                action(size)
            }
    }

    private var sizeView: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
        }
    }
}

extension View {
    func onSizeChange(perform action: @escaping (CGSize) -> Void) -> some View {
        modifier(OnSizeChangeViewModifier(perform: action))
    }
}
