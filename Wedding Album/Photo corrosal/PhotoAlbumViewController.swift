//
//  PhotoAlbumViewController.swift
//  Wedding Album
//
//  Created by apple on 26/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import Photos

class PhotoAlbumViewController: UIViewController {
    
    var titles1:[String] = []
    var haldiImages:[UIImage] = []
    var sangeet:[UIImage] = []
    var mehendi:[UIImage] = []
    var muhurtam:[UIImage] = []
    var reception:[UIImage] = []
    var photoshoot:[UIImage] = []
    var bgStr:[UIImage] = []
    
    
    var newHaldiImgs:[String] = []
    var newSangeetImgs:[String] = []
    var newMehendiImgs:[String] = []
    var newMuhurtamImgs:[String] = []
    var newReceptionImgs:[String] = []
    var newPhotoShootImgs:[String] = []
    var newBgImgs:[String] = []
    
    
    @IBOutlet weak var overLayView: UIView!
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var homebuttonout: UIButton!
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    
    @IBOutlet weak var backButOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButOutlet.layer.cornerRadius = backButOutlet.layer.frame.size.width/2
        
        homebuttonout.layer.cornerRadius = homebuttonout.layer.frame.size.width/2
        overLayView.alpha = 0.3
        albumCollectionView.dataSource = self
        albumCollectionView.delegate = self
        albumCollectionView.register(UINib(nibName: "PhotoAlbumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoAlbumCollectionViewCell")
        albumCollectionView.backgroundColor = .clear
        getPhotosOfHaldi()
        getPhotosOfSangeet()
        getPhotosOfMehendi()
        getPhotosOfReception()
        getPhotosOfMuhurtam()
        getPhotosOfPhotoshoot()
        getPhotosOfBg()
        
        getImage()
        getFolderNames()
        getHaldiImages()
        getSangeetImages()
        getMehendiImages()
        getMuhurtamImages()
        getReceptionImages()
        getPhotoShootImages()
        getBGImages()
        
    }
    
    
    
    
    
    
    
    //MARK:- get folder names
    
    func getFolderNames(){
        func contentsOfDirectoryAtPath(path: String) -> [String]? {
            guard let paths = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Photos/") else { return nil}
            
            titles1.append(contentsOf: paths)
            if titles1.contains(".DS_Store"){
                titles1.remove(at: paths.index(of: ".DS_Store")!)
            }
            
            titles1.sort()
            titles1.remove(at: 0)
            //   print("Titles after removing first element", titles1)
            
            return paths.map { aContent in (path as NSString).appendingPathComponent(aContent)}
            
        }
        
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        
        let allContents = contentsOfDirectoryAtPath(path: searchPath)
        print(allContents)
        
        
    }
    
    //MARK:- get photos to an array
    
    func getPhotosOfHaldi(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let paths = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Photos/Haldi") else { return nil }
            newHaldiImgs.append(contentsOf: paths)
            //   print("New Haldi Images", newHaldiImgs)
            
            
            return paths.map{ aContent in (path as NSString).appendingPathComponent(aContent)}
            
        }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    // MARK:- Get Image  directory
    
    func getHaldiDirectory() -> String {
        
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Haldi")
        
        // print(paths)
        return paths
    }
    
    
    //MARK:- haldi images
    
    func getHaldiImages(){
        let fileManager = FileManager.default
        for i in newHaldiImgs {
            let imagePath = (getHaldiDirectory() as NSString).appendingPathComponent(i)
            //     print(imagePath)
            let url = imagePath
            if fileManager.fileExists(atPath: url) {
                let image = UIImage(contentsOfFile: url)
                haldiImages.append(image!)
                //    print("content of haldi ",haldiImages)
            }
            else {
                //      print("No image found in haldi directory")
            }
        }
        
        
        
    }
    
    
    func getPhotosOfSangeet(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Photos/Sangeet") else { return nil }
            newSangeetImgs.append(contentsOf: path1)
            //  print("New Sangeet Images", newSangeetImgs)
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    // MARK:- Get Image  directory
    
    func getSangDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Sangeet")
        //   print(paths)
        return paths
    }
    
    
    
    //MARK:- sangeet images
    func getSangeetImages(){
        
        let fileManager = FileManager.default
        for i in newSangeetImgs {
            let imagePath = (getSangDirectory() as NSString).appendingPathComponent(i)
            //    print(imagePath)
            let url = imagePath
            if fileManager.fileExists(atPath: url) {
                let image = UIImage(contentsOfFile: url)
                sangeet.append(image!)
                //    print("content of haldi ",sangeet)
            }
            else {
                print("No image found in sangeet directory")
            }
        }
        
    }
    
    
    
    
    
    
    func getPhotosOfMehendi(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path2 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Photos/Mehendi") else { return nil }
            newMehendiImgs.append(contentsOf: path2)
            //   print("New Mehendi Images", newMehendiImgs)
            return path2.map{ aContent in (path as NSString).appendingPathComponent(aContent)}
        }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    
    
    //MARK:- Mehendi images
    
    func getMehDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Mehendi")
        return paths
    }
    
    
    func getMehendiImages(){
        
        let fileManager = FileManager.default
        for i in newMehendiImgs {
            let imagePath = (getMehDirectory() as NSString).appendingPathComponent(i)
            //print(imagePath)
            let url = imagePath
            if fileManager.fileExists(atPath: url) {
                let image = UIImage(contentsOfFile: url)
                mehendi.append(image!)
                //  print("content of haldi ",mehendi)
            }
            else {
                print("No image found in mehendi directory")
            }
        }
    }
    
    
    
    func getPhotosOfMuhurtam(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path2 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Photos/Muhurtam") else { return nil }
            newMuhurtamImgs.append(contentsOf: path2)
            //   print("New Muhurtam Images", newMuhurtamImgs)
            return path2.map{ aContent in (path as NSString).appendingPathComponent(aContent)}
        }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    
    func getMuhuDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Muhurtam")
        // print(paths)
        return paths
    }
    
    //MARK:- muhurtam images
    
    func getMuhurtamImages(){
        
        let fileManager = FileManager.default
        for i in newMuhurtamImgs {
            let imagePath = (getMuhuDirectory() as NSString).appendingPathComponent(i)
            // print(imagePath)
            let url = imagePath
            if fileManager.fileExists(atPath: url) {
                let image = UIImage(contentsOfFile: url)
                muhurtam.append(image!)
                //  print("content of muhurtam ",muhurtam)
            }
            else {
                print("No image found in mehendi directory")
            }
        }
        
    }
    
    
    func getPhotosOfReception(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Photos/Reception") else { return nil }
            newReceptionImgs.append(contentsOf: path1)
            // print("New Reception Images", newReceptionImgs)
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    //MARK:- Reception images
    
    func getRecpDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Reception")
        //   print(paths)
        return paths
    }
    
    func getReceptionImages(){
        let fileManager = FileManager.default
        for i in newReceptionImgs {
            let imagePath = (getRecpDirectory() as NSString).appendingPathComponent(i)
            //   print(imagePath)
            let url = imagePath
            if fileManager.fileExists(atPath: url) {
                let image = UIImage(contentsOfFile: url)
                reception.append(image!)
                //  print("content of reception ",reception)
            }
            else {
                print("No image found in mehendi directory")
            }
        }
    }
    
    
    func getPhotosOfPhotoshoot(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Photos/PhotoShoot") else { return nil }
            newPhotoShootImgs.append(contentsOf: path1)
            //  print("New Photoshoot Images", newPhotoShootImgs)
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    //MARK:- Photoshoot images
    
    func getPhotoshootDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/PhotoShoot")
        // print(paths)
        return paths
    }
    
    
    func getPhotoShootImages(){
        
        let fileManager = FileManager.default
        for i in newPhotoShootImgs {
            let imagePath = (getPhotoshootDirectory() as NSString).appendingPathComponent(i)
            // print(imagePath)
            let url = imagePath
            if fileManager.fileExists(atPath: url) {
                let image = UIImage(contentsOfFile: url)
                photoshoot.append(image!)
                //   print("content of photoshoot ",photoshoot)
            }
            else {
                print("No image found in mehendi directory")
            }
        }
        
    }
    
    
    func getPhotosOfBg(){
        func contentsOfDirectoryPath(path: String)-> [String]?{
            
            guard let path1 = try? FileManager.default.contentsOfDirectory(atPath: path + "/Anusha-&-Sharath/Photos/Background") else { return nil }
            newBgImgs.append(contentsOf: path1)
            //   print("New Bg Images", newBgImgs)
            
            newBgImgs.sort()
            //    print("sorted", newBgImgs)
            
            if newBgImgs.contains(".DS_Store"){
                newBgImgs.remove(at: newBgImgs.index(of: ".DS_Store")!)
            }
            newBgImgs.remove(at: newBgImgs.index(of: "muhurtamBg.jpg")!)
            
            // print("removed", newBgImgs)
            
            return path1.map{ aContent in (path as NSString).appendingPathComponent(aContent)}           }
        let searchPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
        let contents = contentsOfDirectoryPath(path: searchPath)
    }
    
    
    //MARK:- Background directory
    func getBgDirectory() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Background")
        return paths
    }
    //MARK:- background images
    
    func getBGImages(){
        
        let fileManager = FileManager.default
        
        for i in newBgImgs {
            let imagePath = (getBgDirectory() as NSString).appendingPathComponent(i)
            // print(imagePath)
            let url = imagePath
            if fileManager.fileExists(atPath: url) {
                let image = UIImage(contentsOfFile: url)
                bgStr.append(image!)
                
            }
            else {
                print("No image found in mehendi directory")
            }
        }
        
        
    }
    
    
    // MARK:- Get Image  directory
    
    func getDirectoryPath() -> String {
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("Anusha-&-Sharath/Photos/Muhurtam")
        return paths
    }
    
    
    // MARK:- Get Image from directory
    
    func getImage(){
        let fileManager = FileManager.default
        
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent("muhurtam4.jpg")
        if fileManager.fileExists(atPath: imagePAth){
            self.bgImage.image = UIImage(contentsOfFile: imagePAth)
        }else{
            print("No Image")
        }
    }
    
    
    
    
    
    func saveImage(){
        let document = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        // print(document)
        let imgUrl = document.appendingPathComponent("reception.jpg", isDirectory: true)
        // print(imgUrl.path)
        if !FileManager.default.fileExists(atPath: imgUrl.path){
            
            do{
                try UIImage(named: "reception.jpg")!.pngData()?.write(to: imgUrl)
                // print("Image add successfully")
            }catch {
                print("Image not added")
                
            }
        }
    }
    
    
    
    
    
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoAlbumViewController")
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        navigationController?.popViewController(animated: true)
    }
    
}






extension PhotoAlbumViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoAlbumCollectionViewCell", for: indexPath) as! PhotoAlbumCollectionViewCell
        if titles1.count == bgStr.count{
            cell.albumImages.image = bgStr[indexPath.row]
        }else{
            cell.albumImages.image = UIImage(named: "muhurtamBg.jpg")
        }
        cell.albumTitles.text = titles1[indexPath.row]
        cell.layer.borderWidth = 5
        cell.layer.borderColor = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        // print("bgstr count",bgStr.count, bgStr)
        // print("foldertitles count",titles1.count, titles1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row{
        case 0:
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoViewController") as! PhotoViewController
            
            vc.imagesFromVc = haldiImages
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoViewController") as! PhotoViewController
            
            vc.imagesFromVc = mehendi
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoViewController") as! PhotoViewController
            
            vc.imagesFromVc = muhurtam
            navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoViewController") as! PhotoViewController
            
            vc.imagesFromVc = photoshoot
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoViewController") as! PhotoViewController
            
            vc.imagesFromVc = reception
            navigationController?.pushViewController(vc, animated: true)
            
        case 5:
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoViewController") as! PhotoViewController
            
            vc.imagesFromVc = sangeet
            navigationController?.pushViewController(vc, animated: true)
            
            
            
        default:
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoViewController") as! PhotoViewController
            vc.imagesFromVc = photoshoot
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
    }
}

extension PhotoAlbumViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250 , height: 180)
    }
}







