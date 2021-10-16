//
//  PhotoItemViewModel.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 16/10/2021.
//

import Foundation

class PhotoItemViewModel: NSObject, RowViewModel, ViewModelPressible {
    
    var photoItem:PhotoElement?
    var didSelectPhoto: ((PhotoElement) -> Void)?

    init(photoItem:PhotoElement){
        self.photoItem = photoItem
    }
    
    func cellIdentifier() -> String {
        return PhotoItemViewCell.cellIdentifier()
    }
    
    func cellPressed() {
        if let photo = photoItem{
            self.didSelectPhoto?(photo)
        }
    }

}
