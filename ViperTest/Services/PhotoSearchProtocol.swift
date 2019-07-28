//
//  PhotoSearchProtocol.swift
//  ViperTest
//
//  Created by user on 28/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

protocol PhotoSearchProtocol: class {
    func fetchPhotosForSearchText(_ text: String, page: Int, completion: @escaping ([Photo]?) -> Void)
    func fetchImageByURL(_ url: URL, completion: @escaping (UIImage?) -> Void)
}
