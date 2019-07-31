//
//  PhotoSearchPresenter.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

class PhotoSearchPresenter {
    
    var interactor: PhotoSearchInteractorInput!
    unowned var view: PhotoViewControllerInput!
    
    
    
}

extension PhotoSearchPresenter: PhotoSearchPresenterInput {
    
    func getPhotosWithSearchTag(_ searchTag: String, page: Int) {
        interactor.fetchPhotosWithSearchTag(searchTag, page: page)
    }
    
    func providedPhotos(_ photos: [Photo], totalPages: Int) {
        view.displayFetchedPhotos(photos, totalPages: totalPages)
    }
    
    func serviceError(_ error: NSError) {
        view.displayErrorViewWithText(error.localizedDescription)
    }
    
}
