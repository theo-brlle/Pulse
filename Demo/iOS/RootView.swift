//
//  RootView.swift
//  Pulse Demo iOS
//
//  Created by Théo Brouillé on 02/04/2024.
//  Copyright © 2024 kean. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State private var isSheetPresented: Bool = false

    var body: some View {
        VStack {
            Text("Pulse UI Demo")
                .font(.title.bold())

            Button {
                isSheetPresented = true
            } label: {
                Text("Present Sheet")
            }
        }
        .sheet(isPresented: $isSheetPresented) {
            Button {
                isSheetPresented = false
            } label: {
                VStack {
                    Image(systemName: "xmark.circle")

                    Text("Dismiss Sheet")
                }
            }
        }
    }
}
