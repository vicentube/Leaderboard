// LeaderboardApp.swift
// Leaderboard
//
// Creado el 29/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

import SwiftUI

@main
struct LeaderboardApp: App {
  @StateObject private var model = Leaderboard()
  
  var body: some Scene {
    WindowGroup {
      PlayerListView()
        .environmentObject(model)
    }
  }
}
