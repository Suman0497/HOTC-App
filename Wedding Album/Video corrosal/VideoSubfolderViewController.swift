//
//  VideoSubfolderViewController.swift
//  Wedding Album
//
//  Created by apple on 02/11/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class VideoSubfolderViewController: UIViewController {
    var Videos:[String] = []
    var muhurtamVideo:[String] = []
    var receptionVideo:[String] = []
    var haldiVideo:[String] = []
    var sangeetVideo:[String] = []
    var mehendiVideo:[String] = []
    var photoShootVideo:[String] = []
    
    var newMuhVideo:[String] = []
    var newMehVideo:[String] = []
    var newSangVideo:[String] = []
    var newHaldiVideo:[String] = []
    var newReceptionVideo:[String] = []
    var newPhotoShootVideo:[String] = []
    
    
    var appendedMuhuVideos:[String] = []
    var appendedMehendiVideos:[String] = []
    var appendedReceptionVideos:[String] = []
    var appendedSangeetVideos:[String] = []
    var appendedHaldiVideos:[String] = []
    var appendedPhotoshootVideos:[String] = []
    
    var videoTitles = ""
    var thumbnails = ""
    var mainTitle = ""
    var cellImage:[UIImage] = []
    var bgImageBackground = UIImage()
    
    var indexPathRow = 0
    
 
    
    
    private lazy var player: AVPlayer = .init()
    
    var playerLayer: AVPlayerLayer?
    var playercontroller = AVPlayerViewController()
    var playVideo : AVPlayer?
    
    var empty = ""
    
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var overlayView: UIView!
    
    @IBOutlet weak var videosTitle: UIButton!
    
    @IBOutlet weak var homebutton: UIButton!
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBOutlet weak var backButtonOutlet: UIButton!
    
    @IBOutlet weak var collectVideos: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Video tiltles", videoTitles)
        
        backButtonOutlet.layer.cornerRadius = backButtonOutlet.layer.frame.size.width/2
        
        homebutton.layer.cornerRadius = homebutton.layer.frame.size.width/2
        
        overlayView.alpha = 0.3
        collectVideos.delegate = self
        collectVideos.dataSource = self
        collectVideos.register(UINib(nibName: "VideoSubfolderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideoSubfolderCollectionViewCell")
        collectVideos.backgroundColor = .clear
        getThumbnailImages()
        getThumbnail()
        videosTitle.setTitle(mainTitle, for: .normal)
        BackgroundImages()
        
       
        
        
    }
    
    //MARK:- get thumbnail images
    
    func getThumbnail() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Thumbnails")
        return paths
    }
    
    
    //MARK:- thumbnails images
    
    func getThumbnailImages(){
        let fileManager = FileManager.default
        
        let imagePath = (self.getThumbnail() as NSString).appendingPathComponent("thumb3.jpg")
        if fileManager.fileExists(atPath: imagePath) {
            let image = UIImage(contentsOfFile: imagePath)
            thumbnails.append(imagePath)
        } else {
            print("No Image")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func BackgroundImages(){
        if videoTitles == "Haldi"{
            bgImage.image = bgImageBackground
            
        }
            
        else if videoTitles == "Mehendi"{
            bgImage.image = bgImageBackground
            
        }
        else if videoTitles == "Muhurtam"{
            bgImage.image = bgImageBackground
            
        }else if videoTitles == "Sangeet"{
            bgImage.image = bgImageBackground
            
        }else if videoTitles == "Reception"{
            bgImage.image = bgImageBackground
        }
        else if videoTitles == "Photoshoot"{
            bgImage.image = bgImageBackground
        }
            
        else {
            print("not matching")
            
        }
        
    }
    
}

extension VideoSubfolderViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Videos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectVideos.dequeueReusableCell(withReuseIdentifier: "VideoSubfolderCollectionViewCell", for: indexPath) as! VideoSubfolderCollectionViewCell
        
        player = AVPlayer(url: URL(fileURLWithPath: Videos[indexPath.item]))
        playercontroller = AVPlayerViewController()
        playercontroller.player = player
        
        playerLayer = AVPlayerLayer(player: player)
        playerLayer!.videoGravity = AVLayerVideoGravity.resize
        cell.overlay?.playerLayer.player = player
        cell.overlay.layer.borderWidth = 3
        cell.overlay.layer.cornerRadius = 3
        cell.overlay.layer.borderColor = UIColor.white.cgColor
        cell.overlay.layer.masksToBounds = false
        cell.overlay.clipsToBounds = true
        self.playVideo =  player
        cell.overlay.layer.addSublayer(playerLayer!)
        playerLayer!.frame = cell.overlay.layer.bounds
        
        if cellImage != nil {
            if Videos.count == cellImage.count{
        cell.img.image = cellImage[indexPath.item]
            }else{
                cell.img.isHidden = true
            }
        }
        //cell.titlelabel.text = videoTitles
        cell.titlelabel.isHidden = true
        cell.layer.borderWidth = 5
        cell.layer.borderColor = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)  {
        
        indexPathRow = indexPath.item
        
        print("indexPath row ", indexPath.row)
        
        
        let player = AVPlayer(url: URL(fileURLWithPath: self.Videos[indexPath.item]))
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320 , height: 250)
    }
    
    
}


//extension VideoSubfolderViewController: UIGestureRecognizerDelegate {
//
//    @IBAction func handleTap(sender: UIGestureRecognizer) {
//        if !PlayerViewController.showsPlaybackControls {
//            PlayerViewController.showsPlaybackControls = true
//        }
//    }
//
//    /// Prevents delivery of touch gestures to AVPlayerViewController's gesture recognizer,
//    /// which would cause controls to hide immediately after being shown.
//    ///
//    /// `-[AVPlayerViewController _handleSingleTapGesture] goes like this:
//    ///
//    ///     if self._showsPlaybackControlsView() {
//    ///         _hidePlaybackControlsViewIfPossibleUntilFurtherUserInteraction()
//    ///     } else {
//    ///         _showPlaybackControlsViewIfNeededAndHideIfPossibleAfterDelayIfPlaying()
//    ///     }
//    public func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailByGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        if !playerVC.showsPlaybackControls {
//            // print("\nshouldBeRequiredToFailByGestureRecognizer? \(otherGestureRecognizer)")
//            if let tapGesture = otherGestureRecognizer as? UITapGestureRecognizer {
//                if tapGesture.numberOfTouchesRequired == 1 {
//                    return true
//                }
//            }
//        }
//        return false
//    }
//
//}
