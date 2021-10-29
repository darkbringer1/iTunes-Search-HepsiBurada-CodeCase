//
//  AdditionalInfoComponent.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 28.10.2021.
//

import UIKit
import BaseComponents

class AdditionalInfoComponent: GenericBaseView<AdditionalInfoComponentData> {
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = (superview?.frame.height ?? 20) / 2
        view.clipsToBounds = true
        view.backgroundColor = .systemPink
        return view
    }()
    
    private lazy var info: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = " "
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.contentMode = .center
        label.textAlignment = .center
        label.font = RobotoHelper.regular(12).value
        label.tintColor = .black
        return label
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(container)
        container.addSubview(info)
        
        NSLayoutConstraint.activate([
            
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            info.topAnchor.constraint(equalTo: container.topAnchor),
            info.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            info.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            info.trailingAnchor.constraint(equalTo: container.trailingAnchor)
            
        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        info.text = data.info
    }
    
}
