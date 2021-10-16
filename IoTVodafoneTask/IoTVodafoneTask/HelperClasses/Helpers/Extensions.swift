//
//  Extensions.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 15/10/2021.
//

import UIKit
import Foundation

public extension UITableViewCell {
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
public extension UICollectionViewCell {
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
