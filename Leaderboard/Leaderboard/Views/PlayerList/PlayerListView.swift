// PlayerListView.swift
// Leaderboard
//
// Creado el 30/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

import SwiftUI

extension PlayerListView: View {
  var body: some View {
    NavigationView {
      ZStack {
        List {
          ForEach(players) { player in
            makeBoundPlayer(player).map { boundPlayer in
              NavigationLink(destination: PlayerDetailView(player: boundPlayer)) {
                PlayerRow(player: player)
              }
            }
          }
          .onMove(perform: movePlayers)
          .onDelete(perform: deletePlayers)
        }
        .navigationBarTitle("Players")
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(action: sortLeaderboard) {
              Image(systemName: "arrow.up.arrow.down")
            }
          }
          ToolbarItem(placement: .navigationBarTrailing) {
            EditButton()
          }
        }
        .sheet(isPresented: $showingNewPlayer) {
          EditPlayerView(player: Player())
        }
        newPlayerButton
      }
      .onAppear(perform: loadPlayers)
    }
  }
  
  var newPlayerButton: some View {
    VStack {
      Spacer()
      HStack {
        Spacer()
        Button(action: showNewPlayerView) {
          Image(systemName: "plus.circle.fill")
            .font(.system(size: 60))
            .padding()
        }
      }
    }
  }
}

struct PlayerListView_Previews: PreviewProvider {
  static let model = Leaderboard.preview
  
  static var previews: some View {
    PlayerListView()
      .environmentObject(model)
  }
}
