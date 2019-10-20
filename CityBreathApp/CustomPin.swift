//
//  CustomPin.swift
//  CityBreathApp
//
//  Created by Alex Koblik-Zelter on 10/20/19.
//  Copyright © 2019 Alex Koblik-Zelter. All rights reserved.
//

import Foundation
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    var image: UIImage? = nil

    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D, image: String) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.image = UIImage(named: image)
        super.init()
    }
}
