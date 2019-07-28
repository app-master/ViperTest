//
//  Photo.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

struct Photo: Decodable {
    
    var farm: Int
    var id: String
    var server: String
    var secret: String
    var title: String
    
    var mediumImageURL: URL {
        return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg")!
    }

    var smallImageURL: URL {
        return URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_s.jpg")!
    }
    
}
