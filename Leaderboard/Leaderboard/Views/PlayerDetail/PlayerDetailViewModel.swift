// PlayerDetailViewModel.swift
// Leaderboard
//
// Creado el 30/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

import SwiftUI

struct PlayerDetailView {
  @Binding var player: Player
  
  @State var showingChangeScore = false
  @State var showingEdit = false
  
  func showEditView() {
    showingEdit = true
  }
  
  func showChangeScoreView() {
    showingChangeScore = true
  }
}
