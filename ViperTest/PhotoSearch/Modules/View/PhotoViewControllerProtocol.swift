//
//  PhotoViewControllerProtocol.swift
//  ViperTest
//
//  Created by user on 28/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

protocol PhotoViewControllerOutput: class {
    func getPhotosWithSearchTag(_ searchTag: String, page: Int)
}

protocol PhotoViewControllerInput: class {
    func displayFetchedPhotos(_ photos: [Photo], totalPages: Int)
    func displayErrorViewWithText(_ text: String)
}
