// ChangeScoreView.swift
// Leaderboard
//
// Creado el 30/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

import SwiftUI

extension ChangeScoreView: View {
  var body: some View {
    VStack {
      toolbar
      Group {
        Text("Change score of")
          .font(.body)
        Text(player.name)
        picture
        Text("Old score: \(player.score)")
          .padding()
        TextField("New score", text: $newScoreText)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding()
      }
      .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
      Spacer()
    }
  }
  
  var toolbar: some View {
    HStack {
      Button(action: dismissView) {
        Text("Cancel")
      }
      Spacer()
      Button(action: saveAndCloseView) {
        Text("Done")
          .fontWeight(.bold)
      }
    }
    .padding()
  }
  
  var picture: some View {
    Image(uiImage: player.pictureImage ?? UIImage(named: "Placeholder")!)
      .resizable()
      .scaledToFit()
      .frame(height: 100)
  }
}

struct ChangeScoreView_Previews: PreviewProvider {
  static let model = Leaderboard.preview
  
  static var previews: some View {
    ChangeScoreView(player: .constant(model.players[0]))
  }
}
