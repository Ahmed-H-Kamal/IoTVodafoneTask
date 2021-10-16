//
//  PhotoItemViewModel.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 16/10/2021.
//

import Foundation

class PhotoItemViewModel: NSObject, RowViewModel, ViewModelPressible {
    
    var photoItem:PhotoElement?

    init(photoItem:PhotoElement){
        self.photoItem = photoItem
    }
    
    func cellIdentifier() -> String {
        return PhotoItemViewCell.cellIdentifier()
    }
    
    func cellPressed() {
    
    }

}
