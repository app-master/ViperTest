//
//  PhotoSearchInteractor.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

class PhotoSearchInteractor: PhotoSearchInteractorInput {
    
    var dataManager: PhotoSearchProtocol!
    unowned var presenter: PhotoSearchInteractorOutput!
    
    func fetchPhotosWithSearchTag(_ searchTag: String, page: Int) {
        
        dataManager.fetchPhotosForSearchText(searchTag, page: page) { photos, totalPages, error in
            if let photos = photos, let totalPages = totalPages {
                self.presenter.providedPhotos(photos, totalPages: totalPages)
            } else if let error = error {
                self.presenter.serviceError(error)
            }
        }
        
    }
    
}
