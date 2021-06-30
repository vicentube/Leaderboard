// PlayerListViewModel.swift
// Leaderboard
//
// Creado el 30/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

import SwiftUI

struct PlayerListView {
  @EnvironmentObject private var model: Leaderboard
  
  @State var showingNewPlayer = false
  
  var players: [Player] {
    model.players
  }
  
  func makeBoundPlayer(_ player: Player) -> Binding<Player>? {
    guard let index = players.firstIndex(where: { $0.id == player.id }) else { return nil }
    return .init(get: { self.model.players[index] },
                 set: { self.model.players[index] = $0 })
  }
  
  func sortLeaderboard() {
    model.players.sort(by: { $0.score > $1.score })
  }
  
  func showNewPlayerView() {
    showingNewPlayer = true
  }
  
  func loadPlayers() {
    model.getAllPlayers()
  }
  
  func movePlayers(indices: IndexSet, newOffset: Int) {
    model.players.move(fromOffsets: indices, toOffset: newOffset)
  }
  
  func deletePlayers(indexSet: IndexSet) {
    model.deletePlayers(indexSet: indexSet)
  }
}
