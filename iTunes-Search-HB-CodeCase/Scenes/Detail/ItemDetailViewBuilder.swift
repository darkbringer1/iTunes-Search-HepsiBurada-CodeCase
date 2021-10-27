//
//  ItemDetailViewBuilder.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import Foundation
import UIKit

class ItemDetailViewBuilder {
    
    class func build(with data: ItemDetailRequest) -> UIViewController {
        let formatter = ItemDetailDataFormatter()
        let viewModel = ItemDetailViewModel(formatter: formatter, data: data)
        return ItemDetailViewController(viewModel: viewModel)
    }
}
