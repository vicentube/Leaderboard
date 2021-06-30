// Leaderboard-Preview.swift
// Leaderboard
//
// Creado el 30/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

extension Leaderboard {
  static var preview: Leaderboard {
    let leaderboard = Leaderboard(services: .preview)
    leaderboard.getAllPlayers()
    return leaderboard
  }
}
