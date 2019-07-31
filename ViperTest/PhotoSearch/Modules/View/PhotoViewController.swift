//
//  PhotoViewController.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var presenter: PhotoViewControllerOutput!
    var currentPage = 1
    var totalPages = 1
    var photos = [Photo]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        PhotoSearchAssembly.sharedInstance.configureModuleWithViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = searchText
        
        performWithSearchText(searchText)
    }
    
    func performWithSearchText(_ text: String) {
        presenter.getPhotosWithSearchTag(text, page: currentPage)
    }
    
}

extension PhotoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if currentPage < totalPages {
            return photos.count + 1
        }
        
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row < photos.count {
            return getPhotoItemCellForCollectionView(collectionView, cellForItemAt: indexPath)
        }
        
        return getPhotoLoadingCellForCollectionView(collectionView, cellForItemAt: indexPath)
    }
    
    private func getPhotoItemCellForCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> PhotoItemCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoItemCell.defaultReuseIdentifier, for: indexPath) as! PhotoItemCell
        
        return cell
    }
    
    private func getPhotoLoadingCellForCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> PhotoLoadingCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoLoadingCell.defaultReuseIdentifier, for: indexPath) as! PhotoLoadingCell
        
        return cell
        
    }
    
}

// MARK: - UICollectionViewDelegate

extension PhotoViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotoViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize.zero
        let lenght = collectionView.bounds.width / 3 - 1
        
        if indexPath.row < photos.count {
            size = CGSize(width: lenght, height: lenght)
        } else {
           size = CGSize(width: collectionView.bounds.width, height: 50)
        }
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
}
