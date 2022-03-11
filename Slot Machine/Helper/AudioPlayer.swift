//
//  AudioPlayer.swift
//  Slot Machine
//
//  Created by Micaella Morales on 3/11/22.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playMP3(_ sound: String) {
  if let url = Bundle.main.url(forResource: sound, withExtension: "mp3") {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.play()
    } catch {
      print("ERROR: Could not find and play the sound file!")
    }
  }
}
