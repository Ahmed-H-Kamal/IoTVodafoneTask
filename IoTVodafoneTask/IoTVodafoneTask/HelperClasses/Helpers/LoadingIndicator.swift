//
//  LoadingIndicator.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 15/10/2021.
//

import Foundation
import SVProgressHUD

class LoadingIndicator {
    static let shared = LoadingIndicator()
    
    func showLoading() {
        SVProgressHUD.show()
    }
    func hideLoading() {
        SVProgressHUD.dismiss()
    }

}

func appLoader()->LoadingIndicator{
    return LoadingIndicator.shared
}
