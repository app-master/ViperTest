//
//  PhotosInfo.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

struct PhotosInfo: Decodable {
    
    var page: Int
    var pages: Int
    var photo: [Photo]
    
}
