//
//  PhotoSearchRouting.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class PhotoSearchRouting: PhotoSearchRoutingProtocolInput {
    
    unowned var viewController: PhotoViewController!
    
    func navigateToPhotoDetail() {
        viewController.performSegue(withIdentifier: "ShowDetailSegue", sender: nil)
    }
    
    func passDataToNextSceneWithSegue(_ segue: UIStoryboardSegue) {
        
        if segue.identifier == "ShowDetailSegue" {
            passDataToShowPhotoDetailScene(segue)
        }
        
    }
    
    // MARK: - Methods
    
    func passDataToShowPhotoDetailScene(_ segue: UIStoryboardSegue) {
        if let selectedIndex = viewController.photoCollectionView.indexPathsForSelectedItems?.first {
            let selectedPhoto = viewController.photos[selectedIndex.row]
            let detailVC = segue.destination as! PhotoDetailViewController
            
            detailVC.presenter.saveSelectedPhotoModel(selectedPhoto)
            
            
            
        }
    }
    
}
