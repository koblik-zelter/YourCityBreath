//
//  ViewController.swift
//  CityBreathApp
//
//  Created by Alex Koblik-Zelter on 10/19/19.
//  Copyright © 2019 Alex Koblik-Zelter. All rights reserved.
//

import UIKit
import MapKit
import MaterialComponents
import FloatingPanel
import CoreLocation


fileprivate let cellID = "cellID"
fileprivate let headerID = "headerID"

class ViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate, CLLocationManagerDelegate {
   
    

    
    let mapBackground: MKMapView = {
        let mb = MKMapView()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    let settingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "Settings"), for: .normal)
        return button
    }()
    
    let navigationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "Navigation"), for: .normal)
        return button
    }()
    
    
    let placeHolder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "placeHolder")
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.tintColor = .init(red: 99/255, green: 213/255, blue: 110/255, alpha: 1)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        view.layer.shadowRadius = 12
        view.layer.shadowOpacity = 0.5
        view.layer.masksToBounds = false
        return view
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    let playButton: MDCButton = {
        let button = MDCButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("PLAY SOUND", for: .normal)
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor(named: "TextPlayColor"), for: .normal)
        button.setBackgroundColor(UIColor(named: "PlayColor"), for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    let soundImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Music")
        return iv
    }()
    var searchController : UISearchController!
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupMapView()
        self.setupLocation()
        self.setupSearchBar()
        self.setupButtons()
        self.setupPlayButton()
       
        self.setupCollection()
       // self.bottomPart()
        let fpc = FloatingPanelController()
        let contentVC = DrawerCollectionViewController()
        contentVC.modalPresentationStyle = .overCurrentContext
        fpc.set(contentViewController: contentVC)

        fpc.isRemovalInteractionEnabled = false // Optional: Let it removable by a swipe-down

        self.present(fpc, animated: true, completion: nil)
       // fpc = FloatingPanelController()

        // Assign self as the delegate of the controller.
//        fpc.delegate = self // Optional
//
//        // Set a content view controller.
//        let contentVC = DrawerCollectionViewController()
//        fpc.set(contentViewController: contentVC)
//
//        // Track a scroll view(or the siblings) in the content view controller.
//        fpc.track(scrollView: contentVC.collectionView)
//
//        // Add and show the views managed by the `FloatingPanelController` object to self.view.
//        fpc.addPanel(toParent: self)
       // drawerView.addSubview()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupLocation() {
        let location = CLLocationCoordinate2D(latitude: 48.879993,
           longitude: 2.355011)
       
       // 2
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: location, span: span)
        mapBackground.setRegion(region, animated: true)
        mapBackground.delegate = self
       //3
      //  let marker = MyAnnotation(title: "title" as! String, subtitle: "subtitle" as! String, coordinate: location, image: "play-pin")
      //  marker.image = UIImage("my image.png")
      //  self.mapView.addAnnotations(marker)
        let ortegaParkAnnotation = MKPointAnnotation()
        ortegaParkAnnotation.coordinate = location
        mapBackground.addAnnotation(ortegaParkAnnotation)

    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
           
        var annotationView = mapBackground.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
           
        if annotationView == nil {
               annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
           
        
        let image = UIImage(named: "Image-1")
        let resizedSize = CGSize(width: 70, height: 70)

        UIGraphicsBeginImageContext(resizedSize)
        image?.draw(in: CGRect(origin: .zero, size: resizedSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        annotationView?.image = resizedImage
           
        annotationView?.canShowCallout = true
           
        return annotationView
    }

    override func viewWillAppear(_ animated: Bool) {
    //    self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupCollection() {
       
//        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
//           // collectionView.backgroundColor = UIColor(named: "BackgroundColor")
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//       // collectionView.bounces = true
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
//        collectionView.register(CollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
//        view.addSubview(collectionView)
//     //       self.view.addSubview(collectionView)
//        collectionView.topAnchor.constraint(equalTo: drawerView.topAnchor, constant: 16).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: drawerView.bottomAnchor).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: drawerView.leadingAnchor).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: drawerView.trailingAnchor).isActive = true
//        collectionView.dataSource = self
//        collectionView.delegate = self
           // collectionView.keyboardDismissMode = .onDrag
            //collectionView.register(ChipsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: chipsHeaderID)
    }
    
    private func setupMapView() {
        self.view.addSubview(mapBackground)
        mapBackground.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapBackground.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapBackground.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mapBackground.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func setupSearchBar() {
        self.searchController = UISearchController(searchResultsController:  nil)
         
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
         
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.obscuresBackgroundDuringPresentation = true
        self.searchController.searchBar.clipsToBounds = true
        searchController.searchBar.sizeToFit()
//         let attributes = [NSAttributedString.Key.foregroundColor : UIColor(named: "SearchColor")]
//         UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(named: "SearchColor")
//
//         UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).clipsToBounds = true
//         UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).layer.cornerRadius = 22
//         UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(attributes, for: .normal)
//         UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor(named: "TextSearchColor")
         
        let microButton1 = UIButton()
        microButton1.setImage(#imageLiteral(resourceName: "Micro"), for: .normal)
        //let mircoButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Micro"), style: .done, target: self, action: #selector(microEnable))
        let microBarButton = UIBarButtonItem(customView: microButton1)
        self.navigationItem.rightBarButtonItem = microBarButton
        self.navigationItem.titleView = searchController.searchBar
        //searchController.searchBar.becomeFirstResponder()
    }
    
    private func setupButtons() {
        self.view.addSubview(placeHolder)
        placeHolder.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        placeHolder.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        placeHolder.heightAnchor.constraint(equalToConstant: 90).isActive = true
        placeHolder.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        self.placeHolder.addSubview(separatorView)
        separatorView.centerYAnchor.constraint(equalTo: self.placeHolder.centerYAnchor).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: self.placeHolder.leadingAnchor).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: self.placeHolder.trailingAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        self.placeHolder.addSubview(settingsButton)
        self.placeHolder.addSubview(navigationButton)
        
        settingsButton.centerXAnchor.constraint(equalTo: self.placeHolder.centerXAnchor).isActive = true
        settingsButton.topAnchor.constraint(equalTo: self.placeHolder.topAnchor, constant: 8).isActive = true
        settingsButton.bottomAnchor.constraint(equalTo: self.separatorView.topAnchor, constant: -8).isActive = true
        
        navigationButton.centerXAnchor.constraint(equalTo: self.placeHolder.centerXAnchor).isActive = true
        navigationButton.topAnchor.constraint(equalTo: self.separatorView.bottomAnchor, constant: 8).isActive = true
        navigationButton.bottomAnchor.constraint(equalTo: self.placeHolder.bottomAnchor, constant: -8).isActive = true
        
       // bottomPart()
        
    }
    
    private func setupPlayButton() {
        self.view.addSubview(playButton)
        //self.view.addSubview(soundImageView)
        
        playButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 60).isActive = true
        playButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
//        soundImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        soundImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        soundImageView.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -16).isActive = true
//        soundImageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
//        soundImageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        
    }
    

    private func bottomPart() {
        let viewController = DrawerCollectionViewController()
        viewController.modalPresentationStyle = .popover
        viewController.view.backgroundColor = .white
        self.present(viewController, animated: true, completion: nil)
    }
    @objc func microEnable() {
        print("We listen to You")
    }
//     func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
//            return RemovablePanelLayout()
//    }
}

extension ViewController: MKMapViewDelegate {
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("Rendering...")
    }
}


extension UIColor {

    static func fromHex(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


//class RemovablePanelLayout: FloatingPanelIntrinsicLayout {
//    var supportedPositions: Set<FloatingPanelPosition> {
//        return [.half, .tip]
//    }
//    func insetFor(position: FloatingPanelPosition) -> CGFloat? {
//        switch position {
//        case .half: return 130.0
//        default: return nil  // Must return nil for .full
//        }
//    }
//}
