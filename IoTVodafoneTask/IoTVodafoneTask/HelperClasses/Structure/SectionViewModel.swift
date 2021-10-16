//
//  SectionViewModel.swift
//  IoTVodafoneTask
//
//  Created by Ahmed Hamdy on 15/10/2021.
//

import Foundation

public class SectionViewModel {
    var rowViewModels: [RowViewModel]
    var sectionModel : SectionModel?

    public init(rowViewModels :[RowViewModel],
                sectionModel : SectionModel?)
    {
        self.rowViewModels = rowViewModels
        self.sectionModel = sectionModel
    }
}
