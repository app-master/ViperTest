//
//  PhotoSearchRoutingProtocol.swift
//  ViperTest
//
//  Created by user on 01/08/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

protocol PhotoSearchRoutingProtocolInput: class {
    func navigateToPhotoDetail()
    func passDataToNextSceneWithSegue(_ segue: UIStoryboardSegue)
}




