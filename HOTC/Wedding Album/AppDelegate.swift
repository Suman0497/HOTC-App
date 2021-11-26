//
//  AppDelegate.swift
//  Wedding Album
//
//  Created by apple on 26/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var folders = ["Photos", "Videos", "Background"]
    var subPhotoFolders = ["Background","Haldi", "Mehendi", "Muhurtam", "PhotoShoot", "Reception", "Sangeet"]
    var subVideoFolders = ["Thumbnails","Haldi", "Mehendi", "Muhurtam", "PhotoShoot", "Reception", "Sangeet"]
    var newHaldiImgs:[String] = []
    var videoArrayCorousel = ["haldiBg.jpg", "mehendiBg.jpg", "muhurtamBg.jpg", "photoShootBg.jpg", "reception.jpg","sangeet.jpg"]
   
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        createDirectory()
        createFolders()
        createPhotoSubFolders()
        createVideoSubFolders()
        saveAllImageToDoc()
       // deleteDirectory()
        //saveMultipleVideoCorouselImages()
        return true
        
        
        
    }
    
    
    // MARK:- Create directory

    func createDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath")
        print(paths)
        if !fileManager.fileExists(atPath: paths){
            try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }else{
            print("Already dictionary created.")
        }
        
        
    }
    
    // MARK:- delete Image from directory

    func deleteDirectory() {
        let fileManager = FileManager.default
        let yourProjectImagesPath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Haldi/Haldi")
        if fileManager.fileExists(atPath: yourProjectImagesPath) {
            try! fileManager.removeItem(atPath: yourProjectImagesPath)
        }
        
    }
    
    
    
    //MARK:- Create subfolders
    func createFolders(){
        for index in folders {
            if FileManager.SearchPathDirectory.documentDirectory.createSubFolder(named: String(index)) {
                print("folder successfully created")
            }
        }
    }
    
    func createPhotoSubFolders(){
        for index in subPhotoFolders {
            if FileManager.SearchPathDirectory.documentDirectory.createPhotoSubFolder(named: String(index)) {
                print("folder successfully created")
            }
        }
    }
    
    func createVideoSubFolders(){
           for index in subVideoFolders {
               if FileManager.SearchPathDirectory.documentDirectory.createVideoSubFolder(named: String(index)) {
                   print("folder successfully created")
               }
           }
       }
    
   
//
//    func createVideoHaldiSubdir(){
//           let fileManager = FileManager.default
//           let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Haldi/Haldi")
//           print(paths)
//           if !fileManager.fileExists(atPath: paths){
//               try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
//           }else{
//               print("Already directory created.")
//           }
//
//
//       }
       
    
    
    
    // MARK:- Save Image to directory
    func saveAllImageToDoc(){
        
        
        let fileManager = FileManager.default
        let haldi = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Haldi/haldi2.jpg")
        guard let haldiImage = UIImage(named: "haldi2.jpg") else { return  }
        let imageData = haldiImage.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: haldi as String, contents: imageData, attributes: nil)
        
        let sangeet = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Sangeet/sangeet.jpg")
        guard let sang = UIImage(named: "sangeet.jpg") else { return  }
        
        let imageData1 = sang.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: sangeet as String, contents: imageData1, attributes: nil)
        
        
        let recp = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Reception/reception1.jpg")
        guard let recption = UIImage(named: "reception1.jpg") else { return  }
        
        let imageData2 = recption.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: recp as String, contents: imageData2, attributes: nil)
        
        let photo = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/PhotoShoot/photo1.jpg")
        guard let photoShoot = UIImage(named: "photo1.jpg") else { return  }
        
        let imageData3 = photoShoot.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: photo as String, contents: imageData3, attributes: nil)
        
        
        let meh = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Mehendi/mehendi2.jpg")
        guard let mehendi = UIImage(named: "mehendi2.jpg") else { return  }
        
        let imageData4 = mehendi.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: meh as String, contents: imageData4, attributes: nil)
        
        let muh = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Muhurtam/muhurtam1.jpg")
        guard let muhurtam = UIImage(named: "muhurtam1.jpg") else { return  }
        
        let imageData5 = muhurtam.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: muh as String, contents: imageData5, attributes: nil)
        
        
        let mainBg = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Background/muhurtamBg.jpg")
        guard let mainBack = UIImage(named: "muhurtamBg.jpg") else { return  }
        
        let mainbg = mainBack.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: mainBg as String, contents: mainbg, attributes: nil)
        
        let photosBg = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Background/muhurtamBg.jpg")
        guard let photosBack = UIImage(named: "muhurtamBg.jpg") else { return  }
        
        let photos = photosBack.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: photosBg as String, contents: photos, attributes: nil)
        
        let videosBg = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Thumbnails/muhurtamBg.jpg")
        guard let videoBack = UIImage(named: "muhurtamBg.jpg") else { return  }
        
        let videos = videoBack.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: videosBg as String, contents: videos, attributes: nil)
        
        
        
        let videoHaldi = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Haldi/Haldi/1.mp4")
        guard let haldiVideoSave = UIImage(named: "1.mp4") else { return  }
        
        let saveHal = haldiVideoSave.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: videoHaldi as String, contents: saveHal, attributes: nil)
        
    }
    
    
//    func saveMultipleVideoCorouselImages(){
//
//        let fileManager = FileManager.default
//        for imageStr in videoArrayCorousel{
//            let document = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Thumbnails/\(imageStr)")
//
//            guard let videoBgImages = UIImage(named: imageStr) else { return  }
//            let videosImages = videoBgImages.jpegData(compressionQuality: 0.5); fileManager.createFile(atPath: document as String, contents: videosImages, attributes: nil)
//        }
//    }
    
    
   func saveMultipleVideoCorouselImages(){
    
    func saveImageDocumentDirectory(image: UIImage, imageName: String) {
    let fileManager = FileManager.default
    let path = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Videos/Thumbnails")
    if !fileManager.fileExists(atPath: path) {
    try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
    }
    let url = NSURL(string: path)
    let imagePath = url!.appendingPathComponent(imageName)
    let urlString: String = imagePath!.absoluteString
        let imageData = image.jpegData(compressionQuality: 0.5)
    fileManager.createFile(atPath: urlString as String, contents: imageData, attributes: nil)
    }
    saveImageDocumentDirectory(image: UIImage(named: "haldiBg.jpg")!, imageName: "Haldi")
    saveImageDocumentDirectory(image: UIImage(named: "mehendiBg.jpg")!, imageName: "Mehendi")
    
    }
    
    
      var videoArrayCorouselUIImage = [UIImage(named: "haldiBg.jpg"), UIImage(named: "mehendiBg.jpg"), UIImage(named: "muhurtamBg.jpg"), UIImage(named: "photoShootBg.jpg"), UIImage(named: "reception.jpg"),UIImage(named: "sangeet.jpg")]
    
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       
    }
    
    
}

extension FileManager.SearchPathDirectory {
    func createSubFolder(named: String, withIntermediateDirectories: Bool = true) -> Bool {
        var url = FileManager.default.urls(for: self, in: .userDomainMask).first
        url?.appendPathComponent("Anusha-&-Sharath")
        print(url)
        do {
            try FileManager.default.createDirectory(at: url!.appendingPathComponent(named), withIntermediateDirectories: withIntermediateDirectories, attributes: nil)
            print(url)
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func createPhotoSubFolder(named: String, withIntermediateDirectories: Bool = true) -> Bool {
          var url = FileManager.default.urls(for: self, in: .userDomainMask).first
          url?.appendPathComponent("Anusha-&-Sharath/Photos")
          print(url)
          do {
              try FileManager.default.createDirectory(at: url!.appendingPathComponent(named), withIntermediateDirectories: withIntermediateDirectories, attributes: nil)
              print(url)
              return true
          } catch {
              print(error)
              return false
          }
      }
    
    func createVideoSubFolder(named: String, withIntermediateDirectories: Bool = true) -> Bool {
           var url = FileManager.default.urls(for: self, in: .userDomainMask).first
           url?.appendPathComponent("Anusha-&-Sharath/Videos")
           print(url)
           do {
               try FileManager.default.createDirectory(at: url!.appendingPathComponent(named), withIntermediateDirectories: withIntermediateDirectories, attributes: nil)
               print(url)
               return true
           } catch {
               print(error)
               return false
           }
       }
}
