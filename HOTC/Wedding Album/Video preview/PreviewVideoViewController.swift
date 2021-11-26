//
//  PreviewVideoViewController.swift
//  Wedding Album
//
//  Created by apple on 27/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVKit

class PreviewVideoViewController: UIViewController {
    let appIcon:UIImageView = UIImageView()
    
    @IBOutlet weak var playerView: UIView!
    
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         backButtonOutlet.layer.cornerRadius = backButtonOutlet.layer.frame.size.width/2
        
        homeButton.layer.cornerRadius = homeButton.layer.frame.size.width/2
        
        let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
        
        appIcon.contentMode = UIView.ContentMode.scaleAspectFit
        appIcon.frame.size.width = 200
        appIcon.frame.size.height = 200
        appIcon.frame = CGRect(x: 927, y: 694, width: 64, height: 54)
        appIcon.image = UIImage(named: "appstore")
        appIcon.tintColor = .white
        self.playerView.addSubview(appIcon)
        
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "VideosViewController")
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func homeButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        navigationController?.popViewController(animated: true)
    }
    
    
}
