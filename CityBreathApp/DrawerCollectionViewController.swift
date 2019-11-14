//
//  DrawerCollectionViewController.swift
//  CityBreathApp
//
//  Created by Alex Koblik-Zelter on 10/19/19.
//  Copyright © 2019 Alex Koblik-Zelter. All rights reserved.
//

import UIKit
import DrawerView

fileprivate let cellID = "cellID"
fileprivate let headerID = "headerID"
class DrawerCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //public var drawerView: DrawerView!
    
    var pollutants: [Co] = []
    var data: ResponseData?
    let layout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "BackColl")
        self.setupCollection()
        self.fetchData()
        // Do any additional setup after loading the view.
    }
    
    private func setupCollection() {
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
       // collectionView.backgroundColor = UIColor(named: "BackgroundColor")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bounces = true
        collectionView.backgroundColor = UIColor(named: "BackColl")
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(CollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.dataSource = self
        collectionView.delegate = self
       // collectionView.keyboardDismissMode = .onDrag
        //collectionView.register(ChipsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: chipsHeaderID)
    }
    
    
    private func fetchData() {
        ApiManager.shared.fetchData { (data) in
            self.data = data
          // self.pollutants.append(contentsOf: data!.data.pollutants)
            self.pollutants.append((data.data.pollutants.co))
            self.pollutants.append((data.data.pollutants.pm25))
            self.pollutants.append((data.data.pollutants.no2))
            self.pollutants.append((data.data.pollutants.o3))
            self.pollutants.append((data.data.pollutants.pm10))
            self.pollutants.append((data.data.pollutants.so2))
            self.collectionView.reloadData()
        }
    }
    
    
    private func getCollectionHeader() -> CollectionHeader? {
        return self.collectionView.supplementaryView(forElementKind: UICollectionView.elementKindSectionHeader, at: IndexPath(row: 0, section: 0)) as? CollectionHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
        cell.pollutant = pollutants[indexPath.item]
        cell.view.sizeToFit()
        
        
        if indexPath.item % 2 != 0 {
            cell.isRight = true
        }
        else {
            cell.isRight = false
        }
        
        if indexPath.item == 1 {
            cell.isRed = true
        }

        else {
            cell.isRed = false
        }
        //cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pollutants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = UICollectionReusableView()
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as? CollectionHeader else { return UICollectionReusableView() }
                header.indexLabel.text = (data?.data.indexes.baqi.aqiDisplay ?? "") + "aqi"
                header.indexNameLabel.text = data?.data.indexes.baqi.category
//                header.categoryCollection.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellID)
//                header.categoryCollection.delegate = categoryHandler
//                header.categoryCollection.dataSource = categoryHandler
                return header
        default:
        assert(false, "Unexpected element kind")
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 5, height: 85)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
