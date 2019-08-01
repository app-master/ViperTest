//
//  PhotoDetailPresenter.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class PhotoDetailPresenter: PhotoDetailPresenterInput {
    
    unowned var view: PhotoDetailViewControllerInput!
    var interactor: PhotoDetailInteractorInput!
    
    
    func saveSelectedPhotoModel(_ photo: Photo) {
        interactor.configurePhotoModel(photo)
    }
    
    func loadPhotoImage() {
        interactor.loadImageFromUrl()
    }
    
    func loadPhotoImageTitle() {
        interactor.getPhotoImageTitle()
    }
    
    
    func sendLoadedFhotoImage(_ image: UIImage) {
        view.displayLoadedPhotoImage(image)
    }
    
    func sendLoadedFhotoImageTitle(_ title: String) {
        view.displayLoadedPhotoTitle(title)
    }
    
    
    
    
}
