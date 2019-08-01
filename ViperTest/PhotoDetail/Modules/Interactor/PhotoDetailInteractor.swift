//
//  PhotoDetailInteractor.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class PhotoDetailInteractor: PhotoDetailInteractorInput {
    
    unowned var presenter: PhotoDetailInteractorOutput!
    var dataManager: loadImageProtocol!
    var photo: Photo?
    
    func configurePhotoModel(_ photo: Photo) {
        self.photo = photo
    }
    
    func loadImageFromUrl() {
        dataManager.fetchImageByURL(photo!.mediumImageURL) { image in
            guard let image = image else { return }
            self.presenter.sendLoadedFhotoImage(image)
            self.presenter.sendLoadedFhotoImageTitle(self.photo!.title)
        }
    }
    
    func getPhotoImageTitle() {
        
        var text = ""
        
        if let title = photo?.title {
            text = title
        }
        
        presenter.sendLoadedFhotoImageTitle(text)
    }
    
}
