//
//  PhotoDetailAssembly.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class PhotoDetailAssembly {
    
    static let sharedInstance = PhotoDetailAssembly()
    
    private init() {}
    
    func configureModuleWithViewController(_ vc: PhotoDetailViewController) {
        
        let serverManager = ServerManager.manager
        let presenter = PhotoDetailPresenter()
        let interator = PhotoDetailInteractor()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interator
        interator.presenter = presenter
        interator.dataManager = serverManager
        
    }
    
}
