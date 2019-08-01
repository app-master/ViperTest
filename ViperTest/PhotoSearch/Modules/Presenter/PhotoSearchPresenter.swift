//
//  PhotoSearchPresenter.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class PhotoSearchPresenter {
    
    var interactor: PhotoSearchInteractorInput!
    unowned var view: PhotoViewControllerInput!
    var router: PhotoSearchRoutingProtocolInput!
    
}

extension PhotoSearchPresenter: PhotoSearchPresenterInput {
    
    func getPhotosWithSearchTag(_ searchTag: String, page: Int) {
        if view.getHavingPhotoCount() == 0 {
            view.showWaitingView()
        }
        interactor.fetchPhotosWithSearchTag(searchTag, page: page)
    }
    
    func providedPhotos(_ photos: [Photo], totalPages: Int) {
        view.hideWaitingView()
        view.displayFetchedPhotos(photos, totalPages: totalPages)
    }
    
    func serviceError(_ error: NSError) {
        view.displayErrorViewWithText(error.localizedDescription)
    }
    
    func goToPhotoDetailScreen() {
        router.navigateToPhotoDetail()
    }
    
    func passDataToNextSceneWithSegue(_ segue: UIStoryboardSegue) {
        router.passDataToNextSceneWithSegue(segue)
    }
    
}
