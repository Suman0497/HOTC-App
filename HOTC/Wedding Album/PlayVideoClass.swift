//
//  PlayVideoClass.swift
//  Wedding Album
//
//  Created by apple on 08/11/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class PlayVideoClass: UIView {
    override static var layerClass : AnyClass {
        return AVPlayerLayer.self;
    }
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer;
    }
    var player: AVPlayer?{
        get {
            return playerLayer.player;
        }
        set {
            playerLayer.player = newValue;
        }
    }
}
