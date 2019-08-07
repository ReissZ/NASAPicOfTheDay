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
    
    @IBAction func executeTransition(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "secondViewController") as? SecondViewController else {
            return
        }
       present(secondViewController, animated: true, completion: nil)
    }
}
