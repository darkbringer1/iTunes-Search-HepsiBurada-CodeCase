//
//  PriceButtonView.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 27.10.2021.
//

import UIKit
import BaseComponents

class PriceButtonView: GenericBaseView<PriceButtonViewData> {
    
    private lazy var shadowContainerView: UIView = {
        let shadow = UIView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        shadow.layer.shadowColor = UIColor.black.cgColor
        shadow.layer.shadowOffset = CGSize(width: 0, height: 2)
        shadow.layer.shadowRadius = 4
        shadow.layer.shadowOpacity = 0.4
        shadow.layer.cornerRadius = 6
        return shadow
    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.backgroundColor = #colorLiteral(red: 0.4117647059, green: 0.6509803922, blue: 0.9764705882, alpha: 1)
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = " "
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        label.contentMode = .center
        label.textAlignment = .center
        label.font = RobotoHelper.light(12).value
        label.tintColor = .black
        return label
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
    addComponents()
    }
    
    private func addComponents() {
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(container)
        container.addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            
            shadowContainerView.topAnchor.constraint(equalTo: topAnchor),
            shadowContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            container.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            container.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 2),
            priceLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -2),
            priceLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 5),
            priceLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5),
            
        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        priceLabel.text = data.price
    }
    
}


