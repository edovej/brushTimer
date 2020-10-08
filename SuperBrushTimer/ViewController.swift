//
//  ViewController.swift
//  SuperBrushTimer
//
//  Created by Edin Vejzagic on 7/9/20.
//  Copyright © by 2020 Edin Vejzagic & VARAPP. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation




var timer = Timer()
var player : AVAudioPlayer!

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    
    //MARK: - Button for startong a video
    

    @IBAction func startTimer(_ sender: Any) {

        print("startan player")
        
        playVideo() 



   }

 
    
    //MARK: - Function for video
    
    
    
    let playerController = AVPlayerViewController()

    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "BrushTheeth", ofType:"mp4") else {
            debugPrint("video.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)

        present(playerController, animated: true) {
            player.play()
        }
    }

    @objc func playerDidFinishPlaying(note: NSNotification) {
        playerController.dismiss(animated: true, completion: nil)
    }

}

