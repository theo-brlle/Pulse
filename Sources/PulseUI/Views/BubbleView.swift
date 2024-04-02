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

    @State private var position = CGPoint(x: 0, y: 0)

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
        .gesture(DragGesture().onChanged { gesture in
            withAnimation {
                position = gesture.location
            }
        })
        .offset(x: position.x, y: position.y)
    }
}

public final class PulseState: ObservableObject {
    @Published public var isConsolePresented: Bool = false

    public init() {}
}
