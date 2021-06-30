// PlayerDetailView.swift
// Leaderboard
//
// Creado el 30/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

import SwiftUI

extension PlayerDetailView: View {
  var body: some View {
    VStack(spacing: 20) {
      picture
      Text("Score: \(player.score)")
        .font(.largeTitle)
      Spacer()
      Button(action: showChangeScoreView) {
        Text("Change score")
          .font(.title)
          .padding()
          .foregroundColor(.white)
          .background(Color.blue)
          .clipShape(RoundedRectangle(cornerRadius: 10))
      }
    }
    .padding()
    .navigationBarTitle(player.name)
    .toolbar { toolbar }
    .sheet(isPresented: $showingEdit) {
      EditPlayerView(player: player)
    }
    .sheet(isPresented: $showingChangeScore) {
      ChangeScoreView(player: $player)
    }
  }
  
  var toolbar: some ToolbarContent {
    ToolbarItem(placement: .navigationBarTrailing) {
      Button(action: showEditView) {
        Image(systemName: "pencil")
      }
    }
  }
  
  var picture: some View {
    Image(uiImage: player.pictureImage ?? UIImage(named: "Placeholder")!)
      .resizable()
      .scaledToFit()
      .frame(height: 250)
  }

}

struct PlayerDetailView_Previews: PreviewProvider {
  static let model = Leaderboard.preview
  
  static var previews: some View {
    PlayerDetailView(player: .constant(model.players[0]))
      .environmentObject(model)
  }
}
