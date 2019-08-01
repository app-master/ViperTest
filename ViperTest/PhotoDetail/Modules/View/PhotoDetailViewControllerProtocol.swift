//
//  PhotoDetailViewControllerProtocol.swift
//  ViperTest
//
//  Created by user on 01/08/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

protocol PhotoDetailViewControllerInput: class {
    func displayLoadedPhotoImage(_ image: UIImage)
    func displayLoadedPhotoTitle(_ title: String)
}

protocol PhotoDetailViewControllerOutput: class {
    func saveSelectedPhotoModel(_ photo: Photo)
    func loadPhotoImage()
    func loadPhotoImageTitle()
}
