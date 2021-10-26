//
//  EmptyBackgroundView.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 26.10.2021.
//

import UIKit
import BaseComponents

class EmptyBackgroundView: GenericBaseView<EmptyBackgrounViewData> {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainer, infoView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var imageContainer: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 5
        temp.clipsToBounds = true
        temp.image = UIImage(named: "emptyView")
        temp.heightAnchor.constraint(equalToConstant: 300).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return temp
    }()
    
}
