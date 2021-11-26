//
//  PlayerViewController.swift
//  Wedding Album
//
//  Created by apple on 29/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class PlayerViewController: UIViewController {
    
    let playerController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        setupAVPlayer()
        
    }
    
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Method , video is finished ")
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupAVPlayer() {
        
        let videoURL = Bundle.main.url(forResource: "hotc", withExtension: "mov") // Get video url
        let avAssets = AVAsset(url: videoURL!)
        let avPlayer = AVPlayer(url: videoURL!)
        let avPlayerLayer = AVPlayerLayer(player: avPlayer)
        
        avPlayerLayer.videoGravity = .resizeAspectFill
        avPlayerLayer.frame = self.view.bounds
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
        self.view.layer.addSublayer(avPlayerLayer)
        avPlayer.play()
        
        
        
    }
}
