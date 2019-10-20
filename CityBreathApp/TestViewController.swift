//
//  TestViewController.swift
//  CityBreathApp
//
//  Created by Alex Koblik-Zelter on 10/19/19.
//  Copyright © 2019 Alex Koblik-Zelter. All rights reserved.
//

import UIKit
import OverlayContainer
class TestViewController: UIViewController, OverlayContainerViewControllerDelegate {

     
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapsController = DrawerCollectionViewController()
             let searchController = ViewController()

             let containerController = OverlayContainerViewController()
             containerController.delegate = self
           
           
             containerController.viewControllers = [
               searchController,
               mapsController
             ]

        // Do any additional setup after loading the view.
    }
    
    
    enum OverlayNotch: Int, CaseIterable {
           case minimum, medium, maximum
       }

       func numberOfNotches(in containerViewController: OverlayContainerViewController) -> Int {
           return OverlayNotch.allCases.count
       }

       func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                           heightForNotchAt index: Int,
                                           availableSpace: CGFloat) -> CGFloat {
           switch OverlayNotch.allCases[index] {
               case .maximum:
                   return availableSpace * 3 / 4
               case .medium:
                   return availableSpace / 2
               case .minimum:
                   return availableSpace * 1 / 4
           }
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
