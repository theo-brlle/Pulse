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
    @State private var position = CGPoint(x: 0, y: 50)

    public init() {}

    public var body: some View {
        Button {
            NotificationCenter.default.post(name: .pulseBubbleTapped, object: nil)
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

extension Notification.Name {
    static let pulseBubbleTapped = Notification.Name("PulseBubbleTappedNotification")
}

public extension View {
    func onPulseBubbleTap(perform action: @escaping () -> Void) -> some View {
        onReceive(NotificationCenter.default.publisher(for: .pulseBubbleTapped)) { _ in
            action()
        }
    }
}
