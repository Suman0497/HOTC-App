//
//  ViewController.swift
//  Wedding Album
//
//  Created by apple on 26/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class ViewController: UIViewController {
    
    var folder1 = ""
    var photos1 = ""
    var videos1 = ""
    var bg:[UIImage] = []
    var newBgMainImg:[String] = []
    
    
    let playerController = AVPlayerViewController()
    
    @IBOutlet weak var bgImageMain: UIImageView!
    
    @IBOutlet weak var coupleNames: UILabel!
    
    @IBOutlet weak var photoButton: UIButton!
    
    @IBOutlet weak var videoButton: UIButton!
    
    
    @IBOutlet weak var viewOverlay: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        viewOverlay.alpha = 0.2
        photoButton.layer.borderWidth = 4
        photoButton.layer.borderColor = .init(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        videoButton.layer.borderWidth = 4
        videoButton.layer.borderColor = .init(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        getCoupleName()
        getPhotoVideoTitle()
        let aString = folder1
        let newString = aString.replacingOccurrences(of: "-", with: " ")
        coupleNames.text = newString
        photoButton.setTitle(photos1, for: .normal)
        videoButton.setTitle(videos1, for: .normal)
        getPhotosOfBgMain()
        getBgImages()
        
        if bg != nil{
            bgImageMain.image = bg[1]
        }else{
            bgImageMain.image = UIImage(named: "muhurtamBg.jpg")
            
        }
        
        
    }
    
    func getCoupleName(){
        func contentsOfDirectoryAtPath(path: String) -> [String]? {
            guard var paths = try? FileManager.default.contentsOfDirectory(atPath: path ) else { return nil}
            if paths.contains(".DS_Store"){
                paths.remove(at: paths.index(of: ".DS_Store")!)
            }
            folder1.append(paths[0])
            return paths.map { aContent in (path as NSString).appendingPathComponent(aContent)}
            
        }
        
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        
        let allContents = contentsOfDirectoryAtPath(path: searchPath)
        print(allContents)
        print(folder1)
        
    }
    
    func getPhotoVideoTitle(){
        func contentsOfDirectoryAtPath(path: String) -> [String]? {
            guard var paths = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/") else { return nil}
            print("paths of folder name is \(paths)")
            
            if paths.contains(".DS_Store"){
                paths.remove(at: paths.index(of: ".DS_Store")!)
            }
            paths.sort()
            print("Paths of ds store removed", paths)
            photos1.append(paths[1])
            videos1.append(paths[2])
            
            print(photos1)
            return paths.map { aContent in (path as NSString).appendingPathComponent(aContent)}
            
        }
        
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let allContents = contentsOfDirectoryAtPath(path: searchPath)
        print(allContents)
        
    }
    
    
    
    
    
    //MARK:- get photos to an array
    
    func getPhotosOfBgMain(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard var paths = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Background") else { return nil }
            
            var haldiFilter = paths.filter({ $0 != ".DS_Store" })
            
            if haldiFilter.contains("Thumbnails") {
                haldiFilter.remove(at: haldiFilter.index(of: "Thumbnails")!)
            }
            
            newBgMainImg.append(contentsOf: haldiFilter)
            
            print("New Main bg Images", newBgMainImg)
            
            return paths.map{ aContent in (path as NSString).appendingPathComponent(aContent)}
            
        }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    // MARK:- Get Image  directory
    
    func getBgMainDirectory() -> String {
        
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Background")
        
        return paths
    }
    
    
    //MARK:- haldi images
    
    func getBgImages(){
        let fileManager = FileManager.default
        for i in newBgMainImg {
            let imagePath = (getBgMainDirectory() as NSString).appendingPathComponent(i)
            let url = imagePath
            if fileManager.fileExists(atPath: url) {
                let image = UIImage(contentsOfFile: url)
                
                if newBgMainImg != nil{
                    bg.append(image!)
                }else{
                    print("No image")
                }
            }
            else {
                print("No image found in Background folder")
            }
        }
        
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "hotc", ofType:"mov") else {
            debugPrint("splash.m4v not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        playerController.showsPlaybackControls = false
        playerController.player = player
        playerController.videoGravity = .resizeAspectFill
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerController.player?.currentItem)
        present(playerController, animated: true) {
            player.play()
        }
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Method , video is finished ")
        
        
        
    }
    
    
    @IBAction func photosButtonTapped(_ sender: Any) {
        
        DispatchQueue.main.async{
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoAlbumViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    @IBAction func videoButtonTapped(_ sender: Any) {
        
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "VideosViewController")
        navigationController?.pushViewController(vc, animated: true)
        
    }
}























