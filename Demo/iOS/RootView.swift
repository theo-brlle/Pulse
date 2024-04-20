//
//  RootView.swift
//  Pulse Demo iOS
//
//  Created by Théo Brouillé on 02/04/2024.
//  Copyright © 2024 kean. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State private var isPulseConsoleViewPresented: Bool = false

    var body: some View {
        Text("Pulse UI Demo")
            .font(.title.bold())
    }
}
