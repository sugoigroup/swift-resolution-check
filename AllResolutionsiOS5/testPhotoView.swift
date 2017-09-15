//
//  ViewController.swift
//  AllResolutionsiOS5
//
//  Created by applenote on 2015. 6. 7..
//  Copyright (c) 2015년 applenote. All rights reserved.
//

import UIKit

class testPhotoView: UIViewController {
    
    var takenPhoto:UIImage?
    @IBOutlet weak var imageVIew: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let availableImage = takenPhoto {
            imageVIew.image = availableImage
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}

