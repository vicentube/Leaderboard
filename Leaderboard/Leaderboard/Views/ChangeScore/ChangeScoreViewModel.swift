// ChangeScoreViewModel.swift
// Leaderboard
//
// Creado el 30/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

import SwiftUI

struct ChangeScoreView {
  @EnvironmentObject private var model: Leaderboard
  @Environment(\.presentationMode) var presentationMode
  
  @Binding var player: Player
  
  @State var newScoreText = ""
  
  func dismissView() {
    presentationMode.wrappedValue.dismiss()
  }
  
  func saveAndCloseView() {
    if let newScore = Int(newScoreText) {
      player.score = newScore
      model.savePlayer(player)
      dismissView()
    } else {
      newScoreText = ""
    }
  }
}
