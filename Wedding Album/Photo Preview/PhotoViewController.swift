//
//  PhotoViewController.swift
//  Wedding Album
//
//  Created by apple on 26/10/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var collect: UICollectionView!
    var imagesFromVc:[UIImage] = []
    
    @IBOutlet weak var homeButtonOutlet: UIButton!
    
    
    @IBOutlet weak var backButtonOut: UIButton!
    var itemsArray = [ItemModel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButtonOut.layer.cornerRadius = backButtonOut.layer.frame.size.width/2
        
        homeButtonOutlet.layer.cornerRadius = homeButtonOutlet.layer.frame.size.width/2
        
        collect.dataSource = self
        collect.delegate = self
        collect.contentInsetAdjustmentBehavior = .always
        
        
        loadData()
        
        setupCollectionViewLayout()
        
    }
    
    
    func loadData() {
        for _ in imagesFromVc {
            itemsArray.append(ItemModel(width: getRandomNumber(), height: getRandomNumber()))
        }
        self.collect.reloadData()
    }
    
    
    func getRandomNumber() -> Int {
        return Int.random(in: 250..<500)
    }
    
    
    
    
    func setupCollectionViewLayout() {
        
        let layout = CHTCollectionViewWaterfallLayout()
        
        layout.minimumColumnSpacing = 3.0
        layout.minimumInteritemSpacing = 3.0
        
        self.collect.collectionViewLayout = layout
    }
    
    
    @IBAction func slideShowButton(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SlideShowViewController") as! SlideShowViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.imageFromVc = imagesFromVc
        
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "PhotoViewController")
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func homebuttonTapped(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController")
        navigationController?.popViewController(animated: true)
    }
    
    
}


extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesFromVc.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collect.dequeueReusableCell(withReuseIdentifier: "PreviewCollectionViewCell", for: indexPath) as! PreviewCollectionViewCell
        cell.images.image = imagesFromVc[indexPath.item]
        cell.images.contentMode = .scaleAspectFill
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        var index = indexPath.row
        let vc = ImagePreviewVC()
        vc.index = index
        vc.imagesFromPrevious = self.imagesFromVc
        vc.passedContentOffset = IndexPath(index: index)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
    
    
}



extension PhotoViewController: CHTCollectionViewDelegateWaterfallLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: itemsArray[indexPath.row].width, height: itemsArray[indexPath.row].height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnCountFor section: Int) -> Int {
        return 4
    }
    
}
