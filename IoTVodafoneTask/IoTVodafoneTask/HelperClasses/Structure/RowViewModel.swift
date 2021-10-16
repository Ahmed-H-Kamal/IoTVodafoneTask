//
//  RowViewModel.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 15/10/2021.
//


import Foundation

public protocol RowViewModel {
    func cellIdentifier() -> String
}

public protocol ViewModelPressible {
    func cellPressed()
}
