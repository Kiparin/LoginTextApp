//
//  PhotoViewController.swift
//  LoginTestApp
//
//  Created by Alexey Kiparin on 05.12.2024.
//

import UIKit

final class PhotoViewController: UIViewController {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    private let photoDataSource: [UIImage] = [
        UIImage(named : "photo1") ?? UIImage(),
        UIImage(named : "photo2") ?? UIImage(),
        UIImage(named : "photo3") ?? UIImage(),
        UIImage(named : "photo4") ?? UIImage(),
        UIImage(named : "photo5") ?? UIImage(),
        UIImage(named : "photo6") ?? UIImage(),
        UIImage(named : "photo7") ?? UIImage(),
        UIImage(named : "photo8") ?? UIImage(),
        UIImage(named : "photo9") ?? UIImage(),
        UIImage(named : "photo10") ?? UIImage(),
        UIImage(named : "photo11") ?? UIImage()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false 
    }
}

extension PhotoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellPhoto", for: indexPath) as! PhotoCollectionViewCell
        cell.photoView.image = photoDataSource[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoDataSource.count
    }
}
