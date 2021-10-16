//
//  PhotoElement.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 16/10/2021.
//

import Foundation

class PhotoElement: Codable {
    let id: String?
    let author: String?
    let width: Int?
    let height: Int?
    let url: String?
    let downloadURL: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case author = "author"
        case width = "width"
        case height = "height"
        case url = "url"
        case downloadURL = "download_url"
    }

    init(id: String?, author: String?, width: Int?, height: Int?, url: String?, downloadURL: String?) {
        self.id = id
        self.author = author
        self.width = width
        self.height = height
        self.url = url
        self.downloadURL = downloadURL
    }
}
