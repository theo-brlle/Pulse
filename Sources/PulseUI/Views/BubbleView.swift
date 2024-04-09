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
    @AppStorage("PulseBubblePresentation") private var isConsoleViewPresented: Bool = false

    @State private var position = CGPoint(x: 0, y: 50)

    public init() {}

    public var body: some View {
        Button {
            withAnimation {
                isConsoleViewPresented = true
            }
        } label: {
            Image(systemName: "network")
                .imageScale(.large)
                .foregroundColor(.white)
                .padding(4)
                .background(Circle().fill(.blue))
        }
        .gesture(DragGesture().onChanged { gesture in
            position = gesture.location
        })
        .offset(x: position.x, y: position.y)
    }
}
