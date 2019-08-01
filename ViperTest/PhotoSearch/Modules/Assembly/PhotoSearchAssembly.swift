//
//  PhotoSearchAssembly.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import Foundation

class PhotoSearchAssembly {
    
    static let sharedInstance = PhotoSearchAssembly()
    
    private init() {}
    
    func configureModuleWithViewController(_ vc: PhotoViewController) {
        
        let presenter = PhotoSearchPresenter()
        let interator = PhotoSearchInteractor()
        let serverManager = ServerManager.manager
        let router = PhotoSearchRouting()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.router = router
        router.viewController = vc
        presenter.interactor = interator
        interator.dataManager = serverManager
        interator.presenter = presenter
        
    }
    
}
