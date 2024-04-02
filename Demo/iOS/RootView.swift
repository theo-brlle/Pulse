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
    @EnvironmentObject var pulseState: PulseState
    @EnvironmentObject var sceneDelegate: SceneDelegate

    var body: some View {
        VStack {
            Text("Pulse UI Demo")
                .font(.title.bold())
        }
        .fullScreenCover(isPresented: $pulseState.isConsolePresented) {
            NavigationView {
                ConsoleView(store: .demo)
            }
        }
        .onAppear {
            sceneDelegate.pulseState = pulseState
        }
    }
}
