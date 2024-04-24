// The MIT License (MIT)
//
// Copyright (c) 2020–2023 Alexander Grebenyuk (github.com/kean).

import SwiftUI
import PulseUI

@main
struct PulseDemo_iOS: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let configuration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)

        configuration.delegateClass = SceneDelegate.self

        return configuration
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate, ObservableObject {
    var bubbleWindow: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = scene as? UIWindowScene else { return }
        setupBubbleWindow(in: scene)
    }

    func setupBubbleWindow(in scene: UIWindowScene) {
        let bubbleWindow = PassthroughWindow(windowScene: scene)
        let bubbleView = BubbleView(store: .demo)
        let bubbleViewController = UIHostingController(rootView: bubbleView)

        bubbleViewController.view.backgroundColor = .clear
        bubbleWindow.rootViewController = bubbleViewController
        bubbleWindow.isHidden = false

        self.bubbleWindow = bubbleWindow
    }
}

class PassthroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let hitView = super.hitTest(point, with: event) else { return nil }
        return rootViewController?.view == hitView ? nil : hitView
    }
}
