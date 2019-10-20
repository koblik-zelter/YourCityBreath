//
//  CollectionCell.swift
//  CityBreathApp
//
//  Created by Alex Koblik-Zelter on 10/19/19.
//  Copyright © 2019 Alex Koblik-Zelter. All rights reserved.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell {
    
    
    var pollutant: Co? {
        didSet {
            guard let pollutant = pollutant else { return }
            title.text = pollutant.displayName
            desc.text = pollutant.fullName
            index.text = pollutant.aqiInformation.baqi.aqiDisplay
        }
    }
    var isRight: Bool! {
        didSet {
            if isRight {
                rightTrailing.isActive = true
                rightLeading.isActive = true
                leftLeading.isActive = false
                leftTrailing.isActive = false
            }
            
            else {
                rightTrailing.isActive = false
                rightLeading.isActive = false
                leftLeading.isActive = true
                leftTrailing.isActive = true
            }
        }
    }
    
    var isRed: Bool! {
        didSet {
            if isRed {
                self.view.backgroundColor = .fromHex(hex: "#FF3B30")
            }
        }
    }
    var rightLeading: NSLayoutConstraint!
    var rightTrailing: NSLayoutConstraint!
    var leftLeading: NSLayoutConstraint!
    var leftTrailing: NSLayoutConstraint!
    
    let view: UIView = {
        let view = UIView()
        //view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(named: "CellColor")
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
      //  label.textColor = .lightGray
        label.backgroundColor = .clear
        label.text = "o3"
        //label.textAlignment = .center
        return label
    }()
    
    let desc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
      //  label.textColor = .lightGray
        label.backgroundColor = .clear
        label.text = "Ozone exellent"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        //label.textAlignment = .center
        return label
    }()
    
    let index: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
      //  label.textColor = .lightGray
        label.backgroundColor = .clear
        label.text = "92"
        //label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews() {
        self.addSubview(view)
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        rightLeading = view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
        rightTrailing = view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        
        leftLeading = view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        leftTrailing = view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16).isActive = true
        
        
        view.addSubview(title)
        
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        view.addSubview(desc)
        desc.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        desc.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
        desc.widthAnchor.constraint(equalToConstant: 100).isActive = true
        desc.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -4).isActive = true
        view.addSubview(index)
        
        index.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        index.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}
