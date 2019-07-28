//
//  PhotoViewController.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var presenter: PhotoViewControllerOutput!
    var currentPage = 1
    var totalPages = 1
    var photos = [Photo]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        PhotoSearchAssembly.sharedInstance.configureModuleWithViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performWithSearchText(searchText)
    }
    
    func performWithSearchText(_ text: String) {
        presenter.getPhotosWithSearchTag(text, page: currentPage)
    }
    
}
