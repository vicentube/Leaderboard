// EditPlayerViewModel.swift
// Leaderboard
//
// Creado el 30/6/21 por Vicente Úbeda (@vicentube)
// Copyright © 2021 Vicente Úbeda. Todos los derechos reservados.

import SwiftUI

struct EditPlayerView {
  @EnvironmentObject private var model: Leaderboard
  @Environment(\.presentationMode) var presentationMode
  
  @State var player: Player
  @State var pickedImage: UIImage? = nil
  @State var playerPicture: UIImage? = nil
  @State var showingImagePicker = false
  
  let thumbnailSize = CGSize(width: 50, height: 50)
  
  init(player: Player) {
    self._player = State(initialValue: player)
  }
  
  func dismissView() {
    presentationMode.wrappedValue.dismiss()
  }
  
  func saveAndCloseView() {
    if let playerPicture = playerPicture {
      player.savePicture(playerPicture)
    }
    model.savePlayer(player)
    dismissView()
  }
  
  func onDismissImagePicker() {
    if let picture = pickedImage {
      playerPicture = picture
      pickedImage = nil
    }
  }
}
