//
//  RootView.swift
//  Pulse Demo iOS
//
//  Created by Théo Brouillé on 02/04/2024.
//  Copyright © 2024 kean. All rights reserved.
//

import SwiftUI
import PulseUI

struct RootView: View {
    @State private var isPulseConsoleViewPresented: Bool = false

    var body: some View {
        VStack {
            Text("Pulse UI Demo")
                .font(.title.bold())
        }
        .fullScreenCover(isPresented: $isPulseConsoleViewPresented) {
            NavigationView {
                ConsoleView(store: .demo)
            }
        }
        .onPulseBubbleTap {
            isPulseConsoleViewPresented = true
        }
    }
}
