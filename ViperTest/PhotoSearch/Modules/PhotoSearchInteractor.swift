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
    
    func fetchPhotosWithSearchTag(_ searchTag: String, page: Int) {
        
        dataManager.fetchPhotosForSearchText(searchTag, page: page) { photos in
            print(photos!)
        }
        
    }
    
    
}
