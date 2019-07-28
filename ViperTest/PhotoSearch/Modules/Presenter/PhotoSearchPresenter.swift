//
//  PhotoSearchPresenter.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

class PhotoSearchPresenter: PhotoSearchPresenterInput {
    
    var interactor: PhotoSearchInteractorInput!
    
    func getPhotosWithSearchTag(_ searchTag: String, page: Int) {
       interactor.fetchPhotosWithSearchTag(searchTag, page: page)
    }
    
}
