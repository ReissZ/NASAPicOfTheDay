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
    
    @IBOutlet weak var nasaTextView: UITextView!
    
    private var picOfTheDay: [NASA] = []
    private var nasaPicURL: URL?
    private var nasaImage: UIImage?
    private var nasaText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        NetworkingService.shared.getPicOfTheDay { [weak self] (response) in
            self?.nasaPicURL = response.url
            self?.nasaText = response.explanation
            
            let imageURL = response.url
            print("imageurl: \(imageURL)")
            UIImage.loadFrom(url: imageURL) { image in
                self?.nasaImageView.image = image
                self?.nasaImage = image
                DispatchQueue.main.async {
                    
                    self?.nasaTextView.text = self?.nasaText
                }
            }
        }
       self.nasaImageHeightConstraint.constant = self.view.frame.size.height / 2
    }
    
    @IBAction func executeTransition(_ sender: Any) {
        
        UIView.animate(withDuration: 3.0, animations: {
            self.nasaTextView.alpha = 1.0
            return
        })
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "secondViewController") as? SecondViewController else {
            return
        }
        secondViewController.nasaText = nasaText
        secondViewController.nasaPicOfTheDayURL = nasaPicURL
        secondViewController.nasaImage = nasaImage
        present(secondViewController, animated: true, completion: nil)
    }
}

extension UIImage {
    
    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
