//
//  collectionHeader.swift
//  CityBreathApp
//
//  Created by Alex Koblik-Zelter on 10/19/19.
//  Copyright © 2019 Alex Koblik-Zelter. All rights reserved.
//

import Foundation
import UIKit

class CollectionHeader: UICollectionReusableView {
    let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
      //  label.textColor = .lightGray
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "C")
        label.text = "Paris"
        //label.textAlignment = .center
        return label
    }()
    
    let temp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
      //  label.textColor = .lightGray
        label.backgroundColor = .clear
        label.text = "11"
        label.textColor = UIColor(named: "C")
        //label.textAlignment = .center
        return label
    }()
    
    let water: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
      //  label.textColor = .lightGray
        label.backgroundColor = .clear
        label.text = "92"
        //label.textAlignment = .center
        label.textColor = UIColor(named: "C")
        return label
    }()
    
    let speed: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
      //  label.textColor = .lightGray
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "C")
        label.text = "12 mph"
        //label.textAlignment = .center
        return label
    }()
    
    let tempIV: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "temperature-3")
       // iv.image.tint
        iv.clipsToBounds = true
        return iv
       }()
    
    let waterIV: UIImageView = {
           let iv = UIImageView()
           iv.translatesAutoresizingMaskIntoConstraints = false
           iv.image = UIImage(named: "humidity-3")
           iv.clipsToBounds = true
           return iv
       }()
    
    let speedIV: UIImageView = {
           let iv = UIImageView()
           iv.translatesAutoresizingMaskIntoConstraints = false
           iv.image = UIImage(named: "wind-3")
           iv.clipsToBounds = true
           return iv
       }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "slightly-smiling-face_1f642")
        iv.clipsToBounds = true
        return iv
    }()
    
    let indexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
      //  label.textColor = .lightGray
        label.backgroundColor = .clear
        label.text = "164 aqi"
        label.textAlignment = .center
       // label.textColor = UIColor.fromHex(hex: "NormalColor")
        //255 98 102
        label.textColor = UIColor.systemGreen
        return label
    }()
    
    let indexNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        //  label.textColor = .lightGray
        label.backgroundColor = .clear
        label.text = "Unhealthy"
        label.textAlignment = .right
        label.textColor = .systemGreen
        //label.textColor = UIColor.fromHex(hex: "NormalColor")
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "BackColl")
        //self.
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        self.addSubview(locationLabel)
        self.addSubview(profileImageView)
        self.addSubview(indexLabel)
        self.addSubview(indexNameLabel)
        //self.addSubview(<#T##view: UIView##UIView#>)
        
        locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        locationLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        locationLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        indexLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        indexLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        profileImageView.trailingAnchor.constraint(equalTo: indexLabel.leadingAnchor, constant: -16).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: indexLabel.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        indexNameLabel.topAnchor.constraint(equalTo: indexLabel.bottomAnchor, constant: 8).isActive = true
        indexNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [tempIV, temp, waterIV, water, speedIV, speed])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
       // stackView.trailingAnchor.constraint(equalTo: self.indexLabel, constant: -40).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
        
        // indexNameLabel.centerYAnchor.constraint(equalTo: indexLabel.centerYAnchor).isActive = true
       // indexNameLabel.trailingAnchor.constraint(equalTo: indexLabel.leadingAnchor, constant: -16).isActive = true
       // indexNameLabel.centerYAnchor.constraint(equalTo: indexLabel.centerYAnchor).isActive = true
        
    }
}
