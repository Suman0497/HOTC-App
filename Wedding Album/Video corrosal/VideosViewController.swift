//
//  VideosViewController.swift
//  Wedding Album
//
//  Created by apple on 27/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import AVKit

class VideosViewController: UIViewController {
    
    @IBOutlet weak var collect: UICollectionView!
    
    @IBOutlet weak var overlayView: UIView!
    
    
    @IBOutlet weak var bgImgVideo: UIImageView!
    
    var videoTitles:[String] = []
    var thumbnails:[String] = []
    var newThumbImgs:[String] = []
    var muhurtamVideos = ""
    var receptionVideos = ""
    var haldiVideos = ""
    var sangeetVideos = ""
    var mehendiVideos = ""
    
    
    
    var muhurtamVideo:[String] = []
    var receptionVideo:[String] = []
    var haldiVideo:[String] = []
    var sangeetVideo:[String] = []
    var mehendiVideo:[String] = []
    var photoshootVideo:[String] = []
    
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
    
    var updatedThumbnails:[UIImage] = []
    
    var empty = ""
    
    var newhaldiThumb:[String] = []
    var haldiThumb:[UIImage] = []
    var newMehendiThumb:[String] = []
    var mehendiThumb:[UIImage] = []
    var newMuhurtamThumb:[String] = []
    var muhurtamThumb:[UIImage] = []
    var newSangThumb:[String] = []
    var sangThumb:[UIImage] = []
    var newReceptionThumb:[String] = []
    var ReceptionThumb:[UIImage] = []
    var newPhotoThumb:[String] = []
    var photoThumb:[UIImage] = []
    
    @IBOutlet weak var backButtonOutl: UIButton!
    
    @IBOutlet weak var homebutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButtonOutl.layer.cornerRadius = backButtonOutl.layer.frame.size.width/2
        
        
        homebutton.layer.cornerRadius = homebutton.layer.frame.size.width/2
        
        overlayView.alpha = 0.3
        collect.delegate = self
        collect.dataSource = self
        collect.register(UINib(nibName: "VideoCorrosalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VideoCorrosalCollectionViewCell")
        collect.backgroundColor = .clear
        getPhotosOfThumbnails()
        getThumbnailImages()
        getFolderNames()
        
        getVideosOfMuhurtam()
        getVideosOfHaldi()
        getVideosOfMehendi()
        getVideosOfSangeet()
        getVideosOfReception()
        getVideosOfPhotoshoot()
        
        muhurtam()
        haldi()
        sangeet()
        reception()
        mehendi()
        photoShoot()
        
        getThumbnailsOfHaldi()
        haldiThumbnail()
        
        getThumbnailsOfMehendi()
        mehendiThumbnail()
        
        getThumbnailsOfMuhurtam()
        muhurtamThumbnail()
        
        getThumbnailsOfRecep()
        receptionThumbnail()
        
        getThumbnailsOfSangeet()
        sangeetThumbnail()
        
        getThumbnailsOfPhotoshoot()
        photoshootThumbnail()
    }
    
    //MARK:- get video titles names
    
    func getFolderNames(){
        func contentsOfDirectoryAtPath(path: String) -> [String]? {
            guard let paths = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/") else { return nil}
            
            videoTitles.append(contentsOf: paths)
            
            if videoTitles.contains(".DS_Store"){
                videoTitles.remove(at: videoTitles.index(of: ".DS_Store")!)
            }
            videoTitles.sort()
            // videoTitles.remove(at: 3)
            videoTitles.remove(at: 6)
            //print(videoTitles)
            return paths.map { aContent in (path as NSString).appendingPathComponent(aContent)}
            
        }
        
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        
        let allContents = contentsOfDirectoryAtPath(path: searchPath)
        print(allContents)
        
        
    }
    
    
    
    func getPhotosOfThumbnails(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Thumbnails") else { return nil }
            newThumbImgs.append(contentsOf: path1)
            
            print("New thumb Images", newThumbImgs)
            
            newThumbImgs.sort()
            print("sorted", newThumbImgs)
            
            newThumbImgs.remove(at: newThumbImgs.index(of: "Bg.jpg")!)
            newThumbImgs.remove(at: newThumbImgs.index(of: "muhurtamBg.jpg")!)
            
            
            print("New thumb Images", newThumbImgs)
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    
    //MARK:- get thumbnail images
    
    func getThumbnail() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Thumbnails")
        print(paths)
        return paths
    }
    
    
    //MARK:- thumbnails images
    
    func getThumbnailImages(){
        
        
        
        let fileManager = FileManager.default
        for i in newThumbImgs {
            let imagePath = (self.getThumbnail() as NSString).appendingPathComponent(i)
            if fileManager.fileExists(atPath: imagePath) {
                let image = UIImage(contentsOfFile: imagePath)
                thumbnails.append(imagePath)
                
                updatedThumbnails.append(image!)
                
                
                print(updatedThumbnails, "Updated thumbnails")
                
            } else {
                print("No Image")
            }
        }
        
    }
    
    
    //MARK:- get Muhurtam video videos
    
    
    func getVideosOfMuhurtam(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Muhurtam") else { return nil }
            
            var haldiFilter = path1.filter({ $0 != ".DS_Store" })
            
            if haldiFilter.contains("Thumbnails") {
                haldiFilter.remove(at: haldiFilter.index(of: "Thumbnails")!)
            }
            
            newMuhVideo.append(contentsOf: haldiFilter)
            
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}
            
            
            
            print("New sangeet video", newMuhVideo)
            
            
        }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    func getMuhurtamVideo() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Muhurtam")
        return paths
    }
    
    
    func muhurtam(){
        
        
        let fileManager = FileManager.default
        
        for i in newMuhVideo {
            
            let video = (getMuhurtamVideo() as NSString).appendingPathComponent(i)
            let urlString: String = video
            if fileManager.fileExists(atPath: urlString) {
                DispatchQueue.main.async {
                    
                    self.muhurtamVideo.append(urlString)
                    
                    self.appendedMuhuVideos = self.muhurtamVideo
                    
                    print("new haldi videos",self.appendedMuhuVideos)
                }
                
            } else {
                print("No Videos available")
            }
            
            
        }
        
        
    }
    
    
    //MARK:- get Reception video videos
    
    func getVideosOfReception(){
        
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Reception") else { return nil }
            var haldiFilter = path1.filter({ $0 != ".DS_Store" })
            
            if haldiFilter.contains("Thumbnails") {
                haldiFilter.remove(at: haldiFilter.index(of: "Thumbnails")!)
            }
            
            newReceptionVideo.append(contentsOf: haldiFilter)
            
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}
            
            
            
            print("New sangeet video", newReceptionVideo)
            
            
        }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    
    func getReceptionVideo() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Reception")
        return paths
    }
    
    
    func reception(){
        
        let fileManager = FileManager.default
        
        for i in newReceptionVideo {
            
            let video = (getReceptionVideo() as NSString).appendingPathComponent(i)
            let urlString: String = video
            if fileManager.fileExists(atPath: urlString) {
                DispatchQueue.main.async {
                    
                    self.receptionVideo.append(urlString)
                    
                    self.appendedReceptionVideos = self.receptionVideo
                    
                    print("new haldi videos",self.appendedReceptionVideos)
                }
                
            } else {
                print("No Videos available")
            }
            
            
        }
    }
    
    
    
    //MARK:- get sangeet video videos
    
    func getVideosOfSangeet(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Sangeet") else { return nil }
            
            var haldiFilter = path1.filter({ $0 != ".DS_Store" })
            
            if haldiFilter.contains("Thumbnails") {
                haldiFilter.remove(at: haldiFilter.index(of: "Thumbnails")!)
            }
            
            
            newSangVideo.append(contentsOf: haldiFilter)
            
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}
            
            
            
            print("New sangeet video", newSangVideo)
            
            
        }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    
    
    func getSangeetVideo() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Sangeet")
        
        return paths
    }
    
    
    func sangeet(){
        
        let fileManager = FileManager.default
        
        for i in newSangVideo {
            
            let video = (getSangeetVideo() as NSString).appendingPathComponent(i)
            let urlString: String = video
            if fileManager.fileExists(atPath: urlString) {
                DispatchQueue.main.async {
                    
                    self.sangeetVideo.append(urlString)
                    
                    self.appendedSangeetVideos = self.sangeetVideo
                    
                    print("new haldi videos",self.appendedSangeetVideos)
                }
                
            } else {
                print("No Videos available")
            }
            
            
        }
    }
    
    
    //MARK:- get Mehendi video videos
    
    func getVideosOfMehendi(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Mehendi") else { return nil }
            var haldiFilter = path1.filter({ $0 != ".DS_Store" })
            
            if haldiFilter.contains("Thumbnails") {
                haldiFilter.remove(at: haldiFilter.index(of: "Thumbnails")!)
            }
            
            newMehVideo.append(contentsOf: haldiFilter)
            
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}
            
            
            
            print("New sangeet video", newMehVideo)
            
            
        }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    
    
    func getMehendiVideo() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Mehendi")
        return paths
    }
    
    
    func mehendi(){
        
        let fileManager = FileManager.default
        
        for i in newMehVideo {
            
            let video = (getMehendiVideo() as NSString).appendingPathComponent(i)
            let urlString: String = video
            if fileManager.fileExists(atPath: urlString) {
                DispatchQueue.main.async {
                    
                    self.mehendiVideo.append(urlString)
                    
                    self.appendedMehendiVideos = self.mehendiVideo
                    
                    print("new haldi videos",self.appendedMehendiVideos)
                }
                
            } else {
                print("No Videos available")
            }
            
            
        }
    }
    
    
    
    func getVideosOfHaldi(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Haldi") else { return nil }
            var haldiFilter = path1.filter({ $0 != ".DS_Store" })
            
            if haldiFilter.contains("Thumbnails") {
                haldiFilter.remove(at: haldiFilter.index(of: "Thumbnails")!)
            }
            
            newHaldiVideo.append(contentsOf: haldiFilter)
            
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}
            
            
            
            print("New sangeet video", newHaldiVideo)
            
            
        }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    //MARK:- get haldi video videos
    
    func getHaldiVideo() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Haldi")
        return paths
    }
    
    
    func haldi(){
        let fileManager = FileManager.default
        
        for i in newHaldiVideo {
            
            let video = (getHaldiVideo() as NSString).appendingPathComponent(i)
            let urlString: String = video
            if fileManager.fileExists(atPath: urlString) {
                DispatchQueue.main.async {
                    
                    self.haldiVideo.append(urlString)
                    
                    self.appendedHaldiVideos = self.haldiVideo
                    
                    print("new haldi videos",self.appendedHaldiVideos)
                }
                
            } else {
                print("No Videos available")
            }
            
            
        }
    }
    
    //MARK:- photoshootvideos
    
    func getVideosOfPhotoshoot(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Photoshoot") else { return nil }
            
            var haldiFilter = path1.filter({ $0 != ".DS_Store" })
            
            if haldiFilter.contains("Thumbnails") {
                haldiFilter.remove(at: haldiFilter.index(of: "Thumbnails")!)
            }
            
            newPhotoShootVideo.append(contentsOf: haldiFilter)
            
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}
            
            
            
            print("New sangeet video", newPhotoShootVideo)
            
            
        }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    
    //MARK:- get haldi video videos
    
    func getPhotoShootVideo() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Photoshoot")
        return paths
    }
    
    
    func photoShoot(){
        
        let fileManager = FileManager.default
        
        for i in newPhotoShootVideo {
            
            let video = (getPhotoShootVideo() as NSString).appendingPathComponent(i)
            let urlString: String = video
            if fileManager.fileExists(atPath: urlString) {
                DispatchQueue.main.async {
                    self.photoshootVideo.append(urlString)
                    
                    
                    
                    self.appendedPhotoshootVideos = self.photoshootVideo
                    
                    print("new haldi videos",self.appendedPhotoshootVideos)
                    
                }
                
            } else {
                print("No Videos available")
            }
            
            
        }
        
    }
    
    //MARK:- thumbnails of haldi
    
    func getThumbnailsOfHaldi(){
        
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Haldi/Thumbnails") else { return nil }
            newhaldiThumb.append(contentsOf: path1)
            newhaldiThumb.sort()
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
        
    }
    
    
    
    //MARK:- get thumbnail images
    
    func getHaldiThumbnailDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Haldi/Thumbnails")
        return paths
    }
    
    
    //MARK:- thumbnails images
    
    func haldiThumbnail(){
        
        
        
        let fileManager = FileManager.default
        for i in newhaldiThumb {
            let imagePath = (self.getHaldiThumbnailDirectory() as NSString).appendingPathComponent(i)
            if fileManager.fileExists(atPath: imagePath) {
                let image = UIImage(contentsOfFile: imagePath)
                if image != nil{
                    haldiThumb.append(image!)
                    
                }
                
            } else {
                print("No Image")
            }
        }
        
    }
    
    //MARK:- mehendi thumbnails
    
    
    
    func getThumbnailsOfMehendi(){
        
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Mehendi/Thumbnails") else { return nil }
            newMehendiThumb.append(contentsOf: path1)
            newMehendiThumb.sort()
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
        
    }
    
    
    
    //MARK:- get thumbnail images
    
    func getMehendiThumbnailDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Mehendi/Thumbnails")
        return paths
    }
    
    
    //MARK:- thumbnails images
    
    func mehendiThumbnail(){
        
        
        
        let fileManager = FileManager.default
        for i in newMehendiThumb {
            let imagePath = (self.getMehendiThumbnailDirectory() as NSString).appendingPathComponent(i)
            if fileManager.fileExists(atPath: imagePath) {
                let image = UIImage(contentsOfFile: imagePath)
                if image != nil{
                    mehendiThumb.append(image!)
                    
                }
                
            } else {
                print("No Image")
            }
        }
        
    }
    
    
    //MARK:- Muhurtam thumbnails
    
    
    
    func getThumbnailsOfMuhurtam(){
        
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Mehendi/Thumbnails") else { return nil }
            newMuhurtamThumb.append(contentsOf: path1)
            newMuhurtamThumb.sort()
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
        
    }
    
    
    
    //MARK:- get thumbnail images
    
    func getMuhurtamThumbnailDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Muhurtam/Thumbnails")
        return paths
    }
    
    
    //MARK:- thumbnails images
    
    func muhurtamThumbnail(){
        
        
        
        let fileManager = FileManager.default
        for i in newMuhurtamThumb {
            let imagePath = (self.getMuhurtamThumbnailDirectory() as NSString).appendingPathComponent(i)
            if fileManager.fileExists(atPath: imagePath) {
                let image = UIImage(contentsOfFile: imagePath)
                if image != nil{
                    muhurtamThumb.append(image!)
                    
                }
                
            } else {
                print("No Image")
            }
        }
        
    }
    
    
    
    //MARK:- Sangeet thumbnails
    
    
    
    func getThumbnailsOfSangeet(){
        
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Sangeet/Thumbnails") else { return nil }
            newSangThumb.append(contentsOf: path1)
            newSangThumb.sort()
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
        
    }
    
    
    
    //MARK:- get thumbnail images
    
    func getSangeetThumbnailDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Sangeet/Thumbnails")
        return paths
    }
    
    
    //MARK:- thumbnails images
    
    func sangeetThumbnail(){
        
        
        
        let fileManager = FileManager.default
        for i in newSangThumb {
            let imagePath = (self.getSangeetThumbnailDirectory() as NSString).appendingPathComponent(i)
            if fileManager.fileExists(atPath: imagePath) {
                let image = UIImage(contentsOfFile: imagePath)
                if image != nil{
                    sangThumb.append(image!)
                    
                }
                
            } else {
                print("No Image")
            }
        }
        
    }
    
    
    //MARK:- Reception thumbnails
    
    
    
    func getThumbnailsOfRecep(){
        
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Reception/Thumbnails") else { return nil }
            newReceptionThumb.append(contentsOf: path1)
            newReceptionThumb.sort()
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
        
    }
    
    
    
    //MARK:- get thumbnail images
    
    func getReceptionThumbnailDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Reception/Thumbnails")
        return paths
    }
    
    
    //MARK:- thumbnails images
    
    func receptionThumbnail(){
        
        
        
        let fileManager = FileManager.default
        for i in newReceptionThumb {
            let imagePath = (self.getReceptionThumbnailDirectory() as NSString).appendingPathComponent(i)
            if fileManager.fileExists(atPath: imagePath) {
                let image = UIImage(contentsOfFile: imagePath)
                if image != nil{
                    ReceptionThumb.append(image!)
                    
                }
                
            } else {
                print("No Image")
            }
        }
        
    }
    
    
    //MARK:- Photoshoot thumbnails
    
    
    
    func getThumbnailsOfPhotoshoot(){
        
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Videos/Photoshoot/Thumbnails") else { return nil }
            newPhotoThumb.append(contentsOf: path1)
            newPhotoThumb.sort()
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
        
    }
    
    
    
    //MARK:- get thumbnail images
    
    func getPhotoShootThumbnailDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Photoshoot/Thumbnails")
        return paths
    }
    
    
    //MARK:- thumbnails images
    
    func photoshootThumbnail(){
        
        
        
        let fileManager = FileManager.default
        for i in newPhotoThumb {
            let imagePath = (self.getPhotoShootThumbnailDirectory() as NSString).appendingPathComponent(i)
            if fileManager.fileExists(atPath: imagePath) {
                let image = UIImage(contentsOfFile: imagePath)
                if image != nil{
                    photoThumb.append(image!)
                    
                }
                
            } else {
                print("No Image")
            }
        }
        
    }
    
    
    
    
    @IBAction func backButton(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homeButton(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        navigationController?.popViewController(animated: true)
    }
    
}
extension VideosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collect.dequeueReusableCell(withReuseIdentifier: "VideoCorrosalCollectionViewCell", for: indexPath) as! VideoCorrosalCollectionViewCell
        
        if videoTitles.count == updatedThumbnails.count{
            cell.imgView.image = updatedThumbnails[indexPath.row]
        }else{
            cell.imgView.image = UIImage(systemName: "person.fill")
        }
        cell.titles.text = videoTitles[indexPath.row]
        cell.layer.borderWidth = 5
        cell.layer.borderColor = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch indexPath.row {
        case 0:
            
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "VideoSubfolderViewController") as! VideoSubfolderViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.videoTitles.append(videoTitles[0])
            var title = videoTitles[0]
            vc.mainTitle = title
            vc.Videos = appendedHaldiVideos
            vc.newHaldiVideo = newHaldiVideo
            vc.bgImageBackground = updatedThumbnails[0]
            vc.newHaldiVideo = newHaldiVideo
            vc.cellImage = haldiThumb
            
        case 1:
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "VideoSubfolderViewController") as! VideoSubfolderViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.videoTitles.append(videoTitles[1])
            var title = videoTitles[1]
            vc.mainTitle = title
            vc.cellImage = mehendiThumb
            vc.bgImageBackground = updatedThumbnails[1]
            vc.Videos = appendedMehendiVideos
            vc.newMehVideo = newMehVideo
            
            
        case 2:
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "VideoSubfolderViewController") as! VideoSubfolderViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.videoTitles.append(videoTitles[2])
            var title = videoTitles[2]
            vc.mainTitle = title
            vc.cellImage = muhurtamThumb
            vc.bgImageBackground = updatedThumbnails[2]
            vc.Videos = appendedMuhuVideos
            vc.newMuhVideo = newMuhVideo
            
        case 3:
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "VideoSubfolderViewController") as! VideoSubfolderViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.videoTitles.append(videoTitles[3])
            var title = videoTitles[3]
            vc.mainTitle = title
            vc.cellImage = photoThumb
            vc.bgImageBackground = updatedThumbnails[3]
            vc.Videos = appendedPhotoshootVideos
            vc.newPhotoShootVideo = newPhotoShootVideo
            
        case 4:
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "VideoSubfolderViewController") as! VideoSubfolderViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.videoTitles.append(videoTitles[4])
            var title = videoTitles[4]
            vc.mainTitle = title
            vc.cellImage = ReceptionThumb
            vc.bgImageBackground = updatedThumbnails[4]
            vc.Videos = appendedReceptionVideos
            vc.newReceptionVideo = newReceptionVideo
            
        case 5:
            
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "VideoSubfolderViewController") as! VideoSubfolderViewController
            self.navigationController?.pushViewController(vc, animated: true)
            vc.videoTitles.append(videoTitles[5])
            var title = videoTitles[5]
            vc.mainTitle = title
            vc.cellImage = sangThumb
            vc.bgImageBackground = updatedThumbnails[5]
            vc.Videos = appendedSangeetVideos
            vc.newSangVideo = newSangVideo
            
            
        default:
            print("hello")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250 , height: 180)
    }
    
    
    
}


extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
