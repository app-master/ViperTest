//
//  PhotoViewController.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    private var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ServerManager.manager.fetchPhotosForSearchText("Tropical", page: 1) { photos in

            print()
        }
        
        let url = URL(string: "https://farm1.staticflickr.com/2/1418878_1e92283336_m.jpg")!
        
        ServerManager.manager.fetchImageFromURL(url) { image in
            
            print()
            
        }
        
    }
    

}
