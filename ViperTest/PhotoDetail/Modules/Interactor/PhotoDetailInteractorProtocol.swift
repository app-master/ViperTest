//
//  PhotoDetailInteractorProtocol.swift
//  ViperTest
//
//  Created by user on 01/08/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

protocol PhotoDetailInteractorInput: class {
    func configurePhotoModel(_ photo: Photo)
    func getPhotoImageTitle()
    func loadImageFromUrl()
}

protocol PhotoDetailInteractorOutput: class {
    func sendLoadedFhotoImage(_ image: UIImage)
    func sendLoadedFhotoImageTitle(_ title: String)
}
