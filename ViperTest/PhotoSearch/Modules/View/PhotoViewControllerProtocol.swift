//
//  PhotoViewControllerProtocol.swift
//  ViperTest
//
//  Created by user on 28/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

protocol PhotoViewControllerOutput: class {
    func getPhotosWithSearchTag(_ searchTag: String, page: Int)
    func goToPhotoDetailScreen()
    func passDataToNextSceneWithSegue(_ segue: UIStoryboardSegue)
}

protocol PhotoViewControllerInput: class {
    func displayFetchedPhotos(_ photos: [Photo], totalPages: Int)
    func displayErrorViewWithText(_ text: String)
    func showWaitingView()
    func hideWaitingView()
    func getHavingPhotoCount() -> Int
}
