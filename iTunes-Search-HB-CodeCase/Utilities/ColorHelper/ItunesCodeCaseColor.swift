//
//  ItunesCodeCaseColor.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 31.10.2021.
//

import UIKit
import BaseComponents

enum ItunesCodeCaseColor: GenericValueProtocol {
    
    typealias Value = UIColor
    
    var value: UIColor {
        switch self {
            case .background:
                return #colorLiteral(red: 0.6562497851, green: 0.904574275, blue: 0.9763489366, alpha: 1)
            case .priceButton:
                return #colorLiteral(red: 0.4116407633, green: 0.6510279179, blue: 0.9763496518, alpha: 1)
            case .infoCard:
                return #colorLiteral(red: 0.2584978342, green: 0.756911695, blue: 0.968505919, alpha: 1)
        }
    }
    
    case background
    case priceButton
    case infoCard
}
