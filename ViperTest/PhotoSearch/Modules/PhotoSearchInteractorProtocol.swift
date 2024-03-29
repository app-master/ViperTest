//
//  PhotoSearchInteractorProtocol.swift
//  ViperTest
//
//  Created by user on 28/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

protocol PhotoSearchInteractorInput {
    func fetchPhotosWithSearchTag(_ searchTag: String, page: Int)
}

protocol PhotoSearchInteractorOutput: class {
    func providedPhotos(_ photos: [Photo], totalPages: Int)
    func serviceError(_ error: NSError) 
}
