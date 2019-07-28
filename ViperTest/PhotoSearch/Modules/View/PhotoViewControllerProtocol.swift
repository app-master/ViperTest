//
//  PhotoViewControllerProtocol.swift
//  ViperTest
//
//  Created by user on 28/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

protocol PhotoViewControllerOutput {
    func getPhotosWithSearchTag(_ searchTag: String, page: Int)
}
