//
//  CustomImageViewComponentContainer.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 25.10.2021.
//

import UIKit
import BaseComponents

//MARK: - A CONTAINER FOR OUR IMAGE TO LIVE INSIDE...

class CustomImageViewComponentContainer: GenericBaseView<CustomImageViewComponentData> {
    
    private lazy var shadowContainerView: UIView = {
        let shadow = UIView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        shadow.layer.shadowColor = UIColor.black.cgColor
        shadow.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadow.layer.shadowRadius = 4
        shadow.layer.shadowOpacity = 0.4
        shadow.layer.cornerRadius = 10
        return shadow
    }()
    
    private lazy var customImageView: CustomImageViewComponent = {
        let image = CustomImageViewComponent()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addCustomImageView()
    }
    
    private func addCustomImageView() {
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(customImageView)
        
        NSLayoutConstraint.activate([
            
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowContainerView.topAnchor.constraint(equalTo: topAnchor),
            shadowContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            customImageView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            customImageView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            customImageView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            customImageView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            
        ])
        
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        customImageView.setData(componentData: data)
        customImageView.contentMode = data.contentMode
    }
    
}

