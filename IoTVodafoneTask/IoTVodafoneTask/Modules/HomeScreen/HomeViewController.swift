//
//  HomeViewController.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 16/10/2021.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    lazy var viewModel : HomeViewModel = {
        return HomeViewModel()
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    // MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.setupBinding()
//        self.setupPullToRefresh()
        self.getPhotosType()
    }
    
    private func setupBinding() {
        
        /* observing sections */
        self.viewModel.sectionViewModels.addObserver() { [weak self] (sectionViewModels) in
            self?.collectionView.reloadData()
        }
        
        self.viewModel.isLoading.addObserver { (isLoading) in
            if isLoading {
                appLoader().showLoading()
            } else {
                appLoader().hideLoading()
            }
        }
        
        self.viewModel.photosList.addObserver() { [weak self] (photos) in
            self?.viewModel.buildViewModels()
        }
        
        self.viewModel.didSelectPhoto = { (photo) in
            self.goToDetailsScreen(photo: photo)
        }
    }
    
    // MARK:- Register Cells
    func registerCells() {
        
        collectionView.register(UINib(nibName: "PhotoItemViewCell", bundle: nil), forCellWithReuseIdentifier: PhotoItemViewCell.cellIdentifier())
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        setCollectionViewFlowLayout()
    }
    
    func getPhotosType() {
        self.viewModel.isLoading.value = true
        self.viewModel.isFetchingData = true
        self.viewModel.getPhotos() { (response, error) in
            if error == nil{
                self.viewModel.photosList.value.append(contentsOf: response!)
                self.viewModel.isLoading.value = false
                self.viewModel.isFetchingData = false
            }else{
                self.viewModel.isLoading.value = false
                self.viewModel.isFetchingData = false
            }
        }
    }

    func goToDetailsScreen(photo: PhotoElement) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "PhotoDetailsViewController") as? PhotoDetailsViewController {
            controller.photo = photo
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}


extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        let sectionViewModel = self.viewModel.sectionViewModels.value[section]
        return sectionViewModel.rowViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{

        let sectionViewModel = self.viewModel.sectionViewModels.value[indexPath.section]
        let rowViewModel = sectionViewModel.rowViewModels[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoItemViewCell.cellIdentifier(), for: indexPath) as! PhotoItemViewCell
        cell.setup(viewModel: rowViewModel)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.sectionViewModels.value.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionViewModel = viewModel.sectionViewModels.value[indexPath.section]
        if let rowViewModel = sectionViewModel.rowViewModels[indexPath.row] as? ViewModelPressible {
            rowViewModel.cellPressed()
        }
    }

    func setCollectionViewFlowLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: self.view.frame.size.width / 2, height: 200)
        layout.scrollDirection = .vertical
        self.collectionView.collectionViewLayout = layout
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(self.collectionView.contentOffset.y >= (self.collectionView.contentSize.height - self.collectionView.bounds.size.height)) {
            if !self.viewModel.isFetchingData {
                self.viewModel.isFetchingData = true
                self.viewModel.pageCounter = self.viewModel.pageCounter + 1
                getPhotosType()
            }
        }
    }
}


