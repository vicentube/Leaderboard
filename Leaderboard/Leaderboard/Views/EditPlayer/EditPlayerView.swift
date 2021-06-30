// EditPlayerView.swift
// Leaderboard
//
// Creado el 30/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

import SwiftUI

extension EditPlayerView: View {
  var body: some View {
    VStack {
      toolbar
      ZStack {
        Form {
          name
          picture
        }
      }
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
  
  var name: some View {
    TextField("Player name", text: $player.name)
  }
  
  var picture: some View {
    HStack {
      Text("Player image")
      Spacer()
      Image(uiImage: playerPicture
              ?? player.pictureImage
              ?? UIImage(named: "Placeholder")!)
        .resizable()
        .scaledToFill()
        .frame(width: thumbnailSize.width, height: thumbnailSize.height)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    .onTapGesture { showingImagePicker = true }
    .sheet(isPresented: $showingImagePicker, onDismiss: onDismissImagePicker) {
      ImagePicker(image: $pickedImage)
    }
  }
  
}

struct EditPlayerView_Previews: PreviewProvider {
  static let model = Leaderboard.preview
  
  static var previews: some View {
    EditPlayerView(player: model.players[0])
      .environmentObject(model)
  }
}
