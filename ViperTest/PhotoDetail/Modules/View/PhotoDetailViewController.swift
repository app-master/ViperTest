//
//  PhotoDetailViewController.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitleLabel: UILabel!
    
    var presenter: PhotoDetailViewControllerOutput!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        PhotoDetailAssembly.sharedInstance.configureModuleWithViewController(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.loadPhotoImage()
        presenter.loadPhotoImageTitle()
    }
    
    
    
}

extension PhotoDetailViewController: PhotoDetailViewControllerInput {
    
    func displayLoadedPhotoImage(_ image: UIImage) {
        
        DispatchQueue.main.async {
            self.photoImageView.image = image
        }
        
        
    }
    
    func displayLoadedPhotoTitle(_ title: String) {
        
        DispatchQueue.main.async {
            self.photoTitleLabel.text = title
        }
        
        
    }
    
}
