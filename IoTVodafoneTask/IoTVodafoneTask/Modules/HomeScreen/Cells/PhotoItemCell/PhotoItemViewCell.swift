//
//  PhotoItemViewCell.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 16/10/2021.
//

import Foundation
import UIKit
import SDWebImage

class PhotoItemViewCell: UICollectionViewCell, CellConfigurable {
    
    var viewModel: PhotoItemViewModel?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    // MARK:- configuration
    func setup(viewModel: RowViewModel) {
        if let viewModel = viewModel as? PhotoItemViewModel{
            if let photo = viewModel.photoItem{
                self.configure(photo: photo)
            }
        }
    }
    
    func configure(photo: PhotoElement) {
        self.titleLabel.text = photo.author
        if let url = photo.downloadURL{
            self.photoImageView.sd_setImage(with: URL(string: url))
        }
        
    }

}

