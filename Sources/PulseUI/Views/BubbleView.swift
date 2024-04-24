//
//  BubbleView.swift
//  PulseUI
//
//  Created by Théo Brouillé on 30/03/2024.
//  Copyright © 2024 kean. All rights reserved.
//

import SwiftUI
import Pulse

@available(iOS 14, *)
public struct BubbleView: View {
    @State private var isConsoleViewPresented: Bool = false
    @State private var position: CGPoint = CGPoint(x: 0, y: 50)

    private let store: LoggerStore
    private let consoleMode: ConsoleMode

    public init(store: LoggerStore = .shared, consoleMode: ConsoleMode = .all) {
        self.store = store
        self.consoleMode = consoleMode
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
        .offset(x: position.x, y: position.y)
        .highPriorityGesture(dragGesture)
        .fullScreenCover(isPresented: $isConsoleViewPresented) {
            NavigationView {
                ConsoleView(store: store, mode: consoleMode)
            }
        }
    }

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { gesture in
                position = gesture.location
            }
    }
}
