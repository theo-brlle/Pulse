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
    @State private var position: CGPoint = .zero
    @State private var safeAreaSize: CGSize = .zero
    @State private var bubbleSize: CGSize = .zero

    private let store: LoggerStore
    private let consoleMode: ConsoleMode

    public init(store: LoggerStore = .shared, consoleMode: ConsoleMode = .all) {
        self.store = store
        self.consoleMode = consoleMode
    }

    public var body: some View {
        ZStack {
            Color.clear
                .onSizeChange { size in
                    print("🔍 \(size)")
                    safeAreaSize = size
                }

            bubbleButton
                .onSizeChange { size in
                    bubbleSize = size
                }
//                .position(position)
                .offset(x: position.x - bubbleSize.width / 2, y: position.y - bubbleSize.height / 2)
                .highPriorityGesture(dragGesture)
                .fullScreenCover(isPresented: $isConsoleViewPresented) {
                    NavigationView {
                        ConsoleView(store: store, mode: consoleMode)
                    }
                }
        }
    }
}

private extension BubbleView {
    var bubbleButton: some View {
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

    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { gesture in
                withAnimation {
                    position = gesture.location
                }
            }
            .onEnded { gesture in
                let leftBorder = -safeAreaSize.width / 2
                let rightBorder = safeAreaSize.width / 2
                let topBorder = -safeAreaSize.height / 2
                let bottomBorder = safeAreaSize.height / 2

                let padding: CGFloat = 4

                let x: CGFloat = if gesture.location.x < 0 {
                    leftBorder + bubbleSize.width + padding
                } else {
                    rightBorder - padding
                }

                let y: CGFloat = if gesture.location.y - bubbleSize.height - padding < topBorder {
                    topBorder + bubbleSize.height + padding
                } else if gesture.location.y > bottomBorder {
                    bottomBorder - padding
                } else {
                    gesture.location.y - padding
                }

                withAnimation {
                    position = CGPoint(x: x, y: y)
                }
            }
    }
}
