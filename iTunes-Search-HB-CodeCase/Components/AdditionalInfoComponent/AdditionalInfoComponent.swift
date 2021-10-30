//
//  AdditionalInfoComponent.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 28.10.2021.
//

import UIKit
import BaseComponents

class AdditionalInfoComponent: GenericBaseView<AdditionalInfoComponentData> {
    
    private lazy var shadowContainer: UIView = {
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
        view.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return view
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [shortDescription, longDescription])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.axis = .vertical
        stack.spacing = 15
        return stack
    }()
    
    private lazy var shortDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = " "
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.contentMode = .center
        label.textAlignment = .center
        label.font = RobotoHelper.light(14).value
        return label
    }()
    
    private lazy var longDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = " "
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.contentMode = .center
        label.textAlignment = .center
        label.font = RobotoHelper.regular(18).value
        return label
    }()
    
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addComponents()
    }
    
    private func addComponents() {
        addSubview(shadowContainer)
        shadowContainer.addSubview(container)
        container.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            
            shadowContainer.topAnchor.constraint(equalTo: topAnchor),
            shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            container.topAnchor.constraint(equalTo: shadowContainer.topAnchor),
            container.bottomAnchor.constraint(equalTo: shadowContainer.bottomAnchor),
            container.leadingAnchor.constraint(equalTo: shadowContainer.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor),
            
            mainStack.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
            mainStack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
            mainStack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            mainStack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            
        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        shortDescription.text = data.shortDescription
        longDescription.text = data.longDescription
    }
    
}
