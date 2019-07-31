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
    
    // MARK: - Methods
    
    func performWithSearchText(_ text: String) {
        presenter.getPhotosWithSearchTag(text, page: currentPage)
    }
    
    func configureCell(_ cell: PhotoItemCell, withModel model: Photo) {
        
        ServerManager.manager.fetchImageByURL(model.smallImageURL) { image in
            guard let image = image else { return }
            
            DispatchQueue.main.async {
                cell.photoImageView.image = image
            }
        }
        
    }
    
}

extension PhotoViewController: PhotoViewControllerInput {
    func displayFetchedPhotos(_ photos: [Photo], totalPages: Int) {
        self.photos.append(contentsOf: photos)
        self.totalPages = totalPages
        
        DispatchQueue.main.async {
            self.photoCollectionView.reloadData()
        }
    }
    
    func displayErrorViewWithText(_ text: String) {
        
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
            return photoItemCellForCollectionView(collectionView, cellForItemAt: indexPath)
        } else {
            currentPage += 1
            performWithSearchText(searchText)
            
            return photoLoadingCellForCollectionView(collectionView, cellForItemAt: indexPath)
        }
        
    }
    
    private func photoItemCellForCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> PhotoItemCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoItemCell.defaultReuseIdentifier, for: indexPath) as! PhotoItemCell
        
        let photo = photos[indexPath.row]
        
        configureCell(cell, withModel: photo)
        
        return cell
    }
    
    private func photoLoadingCellForCollectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> PhotoLoadingCell {

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
