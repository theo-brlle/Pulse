//
//  BubbleView.swift
//  PulseUI
//
//  Created by Théo Brouillé on 30/03/2024.
//  Copyright © 2024 kean. All rights reserved.
//

import SwiftUI

@available(iOS 14, *)
public struct BubbleView: View {
    @Binding private var isConsoleViewPresented: Bool

    public init(isConsoleViewPresented: Binding<Bool>) {
        self._isConsoleViewPresented = isConsoleViewPresented
    }

    public var body: some View {
        Button {
            isConsoleViewPresented = true
        } label: {
            Image(systemName: "network")
                .imageScale(.large)
                .foregroundColor(.white)
                .padding(4)
                .background(Circle().fill(.blue))
        }
    }
}
