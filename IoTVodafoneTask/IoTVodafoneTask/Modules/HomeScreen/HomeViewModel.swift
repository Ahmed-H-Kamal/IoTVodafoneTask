//
//  HomeViewModel.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 16/10/2021.
//

import Foundation
import UIKit

class HomeViewModel: NSObject {
    let isLoading = Observable<Bool>(false)
    let sectionViewModels = Observable<[SectionViewModel]>([])
    let photosList = Observable<[PhotoElement]>([])
    var pageCounter = 0
    var didSelectPhoto: ((PhotoElement) -> Void)?
    let refreshControl = Observable<UIRefreshControl>(UIRefreshControl())    
    
    func getPhotos(completion: @escaping(_ photos:[PhotoElement]?, _ error: Error?) -> Void)
    {
        
        let url = formURL(pageCount: 1, pageLimit: 10)
        
        ApiManager.makeApiCall(with: url, method: .get) { (response, error) in
            if (error != nil) {
                completion (nil, error!)
            }
            else {
                if let data = response {
                    do {
                        let decoded = try JSONDecoder().decode([PhotoElement].self, from: data)
                        completion (decoded, nil)
                    } catch {
                        print("*** ERROR *** \(error)")
                    }
                }
            }
        }
    }
    
    func formURL(pageCount: Int, pageLimit: Int) -> String {
        return String(format: Constants.baseURL, pageCount,pageLimit) //pageIndex, limitPerPage
    }
    
    // MARK:- Build View Models
    func buildViewModels() {
        var sectionViewModels = [SectionViewModel]()

        let row_photos = getPhotosViewModels(photoElements: self.photosList.value)
        let section_photos = SectionViewModel(rowViewModels: row_photos, sectionModel: nil)
        sectionViewModels.append(section_photos)
        
        self.sectionViewModels.value = sectionViewModels
    }
    
    func getPhotosViewModels(photoElements: [PhotoElement]) -> [RowViewModel] {
        var listOfPhotos = [RowViewModel]()

        for (index,value) in photoElements.enumerated(){
            
            if index % 5 == 0 && index > 0{
                listOfPhotos.append(getAdsItem())
            }
            
            let model = PhotoItemViewModel(photoItem: value)
            listOfPhotos.append(model)
            
        }
        
        if listOfPhotos.count % 2 != 0{
            listOfPhotos.append(getAdsItem())
        }
        
        return listOfPhotos
    }
    func getAdsItem() -> PhotoItemViewModel {
        let url = "https://thumbs.dreamstime.com/b/hand-holding-poster-business-concept-text-advertise-u-us-vector-illustration-113533578.jpg"
        
        let photoItem = PhotoElement(id: "-1", author: "This is AD", width: 0, height: 0, url: url, downloadURL: url)
        
        let adModel = PhotoItemViewModel(photoItem: photoItem)
        return adModel
    }
    
}
