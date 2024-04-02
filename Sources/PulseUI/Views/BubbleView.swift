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
    @EnvironmentObject private var pulseState: PulseState

    public init() {}

    public var body: some View {
        Button {
            pulseState.isConsolePresented = true
        } label: {
            Image(systemName: "network")
                .imageScale(.large)
                .foregroundColor(.white)
                .padding(4)
                .background(Circle().fill(.blue))
        }
    }
}

public final class PulseState: ObservableObject {
    @Published public var isConsolePresented: Bool = false

    public init() {}
}
