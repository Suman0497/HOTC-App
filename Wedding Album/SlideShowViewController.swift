//
//  SlideShowViewController.swift
//  Wedding Album
//
//  Created by apple on 28/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class SlideShowViewController: UIViewController {
    
    var imageFromVc:[UIImage] = []
    
    @IBOutlet weak var collect: UICollectionView!
    
    
    @IBOutlet weak var pageView: UIPageControl!
    
    var timer = Timer()
    var counter = 0
    
    
    
    @IBOutlet weak var homeButOut: UIButton!
    
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.layer.cornerRadius = backButton.layer.frame.size.width/2
        
        homeButOut.layer.cornerRadius = homeButOut.layer.frame.size.width/2
        
        view.backgroundColor = .black
        navigationController?.isNavigationBarHidden = true
        pageView.numberOfPages = imageFromVc.count
        pageView.currentPage = 0
        pageView.isHidden = true
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changImage), userInfo: nil, repeats: true)
            
        }
        
        
    }
    
    @objc func changImage(){
        if counter < imageFromVc.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collect.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            
            counter += 1
            
        }else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collect.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
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

extension SlideShowViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageFromVc.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collect.dequeueReusableCell(withReuseIdentifier: "slideCell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView
        {
            vc.image = imageFromVc[indexPath.row]
            
        }else if let ab = cell.viewWithTag(222) as? UIPageControl{
            ab.currentPage = indexPath.row
        }
        return cell
    }
    
    
    
    
}

extension SlideShowViewController: UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collect.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
