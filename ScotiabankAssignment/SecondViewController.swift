//
//  SecondViewController.swift
//  ScotiabankAssignment
//
//  Created by Reiss Zurbyk on 2019-08-06.
//  Copyright © 2019 Reiss Zurbyk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nasaImageView: UIImageView!
    
    var nasaPicOfTheDayURL: URL?
    var nasaImage: UIImage?
    var nasaText: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        transitioningDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.nasaImageView.image = nasaImage
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension SecondViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.35, animationType: .present)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.35, animationType: .dismiss)
    }
}
