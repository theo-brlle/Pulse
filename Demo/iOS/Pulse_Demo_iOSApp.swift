// The MIT License (MIT)
//
// Copyright (c) 2020–2023 Alexander Grebenyuk (github.com/kean).

import SwiftUI
import Pulse
import PulseUI
import OSLog

@main
struct PulseDemo_iOS: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @State private var isConsoleViewPresented: Bool = false

    let log = OSLog(subsystem: "app", category: "RootView")

    var body: some View {
        VStack {
            Text("Pulse UI Demo")
                .font(.title.bold())

            BubbleView(isConsoleViewPresented: $isConsoleViewPresented)
        }
        .fullScreenCover(isPresented: $isConsoleViewPresented) {
            NavigationView {
                ConsoleView(store: .demo)
            }
        }
    }
}
