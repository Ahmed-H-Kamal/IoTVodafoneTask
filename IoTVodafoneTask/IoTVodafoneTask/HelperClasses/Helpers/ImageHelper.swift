//
//  ImageHelper.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 17/10/2021.
//

import Foundation
class ImageHelper: NSObject {
    @objc class func getAverageColor(image: UIImage) -> UIColor?{
        if let color = image.averageColor{
            return color
        }
        return nil
    }
}
