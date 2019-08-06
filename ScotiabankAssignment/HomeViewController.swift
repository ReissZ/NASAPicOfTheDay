//
//  HomeViewController.swift
//  ScotiabankAssignment
//
//  Created by Reiss Zurbyk on 2019-08-06.
//  Copyright © 2019 Reiss Zurbyk. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nasaImageView: UIImageView!
    
    @IBOutlet weak var nasaImageHeightConstraint: NSLayoutConstraint!
    override func viewWillAppear(_ animated: Bool) {
        
        nasaImageHeightConstraint.constant = self.view.frame.size.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

