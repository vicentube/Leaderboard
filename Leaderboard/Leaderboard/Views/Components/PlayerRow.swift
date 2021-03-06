// PlayerRow.swift
// Leaderboard
//
// Creado el 30/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

import SwiftUI

struct PlayerRow: View {
  let player: Player
  
  var body: some View {
    HStack {
      picture
      Text(player.name)
      Spacer()
      Text("\(player.score)")
    }
  }
  
  var picture: some View {
    Image(uiImage: player.pictureImage ?? UIImage(named: "Placeholder")!)
      .resizable()
      .scaledToFill()
      .frame(width: 50, height: 50)
      .clipShape(RoundedRectangle(cornerRadius: 10))
  }
}

struct PlayerRow_Previews: PreviewProvider {
  static let model = Leaderboard.preview
  
  static var previews: some View {
    PlayerRow(player: model.players[0])
  }
}
