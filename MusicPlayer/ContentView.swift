//
//  ContentView.swift
//  MusicPlayer
//
//  Created by student on 16/06/2021.
//  Copyright © 2021 swen. All rights reserved.
//

import SwiftUI
import AVKit
import AVFoundation

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    @State var playing = false
    @State var count = 1
    var body: some View {
        ZStack{
            Color.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    //Title
                    Text("Music Player").font(.system(size:45)).fontWeight(.bold).foregroundColor(.primaryColor).padding(.bottom)
                }
                HStack {
                    //Play previous
                    Button(action: {
                        if self.count > 3 {
                            self.count -= 1
                        }
                        else {
                            self.count += 1
                        }
                        self.audioPlayer.stop()
                        let sound = Bundle.main.path(forResource: "mysound\(self.count)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()
                        self.playing = true
                    }) {
                        Image(systemName: "backward").resizable()
                        .frame(width:50, height: 40)
                            .aspectRatio(contentMode: .fit)
                        .foregroundColor(.primaryColor)
                    }.padding()
                    
                    //Play current song
                    Button(action: {
                        if self.audioPlayer.isPlaying{
                            self.audioPlayer.pause()
                            self.playing = false
                        }
                        else{
                            self.audioPlayer.play()
                            self.playing = true
                        }
                    }) {
                        Image(systemName: self.playing ? "pause" : "play").resizable()
                            .frame(width:40, height: 40)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.primaryColor)
                    }.padding()
                    
                    //Play next
                    Button(action: {
                        if self.count < 3 {
                            self.count += 1
                        }
                        else {
                            self.count = 1
                        }
                        self.audioPlayer.stop()
                        let sound = Bundle.main.path(forResource: "mysound\(self.count)", ofType: "mp3")
                        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        self.audioPlayer.play()
                        self.playing = true
                    }) {
                        Image(systemName: "forward").resizable()
                        .frame(width:50, height: 40)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.primaryColor)
                    }.padding()
                }
            }
        }
        .onAppear{
            let sound = Bundle.main.path(forResource: "mysound1", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Copyright free music
/*Sun Rise by Pyrosion | /*https://soundcloud.com/pyrosion*/
 Early Bird by | e s c p | https://escp-music.bandcamp.com
Music promoted by https://www.free-stock-music.com
Creative Commons Attribution-ShareAlike 3.0 Unported
https://creativecommons.org/licenses/by-sa/3.0/deed.en_US*/
