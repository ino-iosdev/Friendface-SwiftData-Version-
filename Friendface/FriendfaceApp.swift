//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Ino Yang Popper on 6/4/25.
//

import SwiftData
import SwiftUI

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
