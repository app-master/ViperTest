//
//  PhotoSearchRouting.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

class PhotoSearchRouting: PhotoSearchRoutingProtocolInput {
    
    unowned var viewController: PhotoViewController!
    
    func navigateToPhotoDetail() {
        viewController.performSegue(withIdentifier: "ShowDetailSegue", sender: nil)
    }
    
}
