//
//  ViewController.swift
//  AllResolutionsiOS5
//
//  Created by applenote on 2015. 6. 7..
//  Copyright (c) 2015년 applenote. All rights reserved.
//

import UIKit

class ViewControllerCustomCamera: UIViewController {

    @IBOutlet weak var captureImageView: UIImageView!
    
    
    var myCamera: Camera?
    var myCaptureImage: CameraCaptureProcess?
    
    var myMedia: Media?
    var myMediaSelect: MediaSelectProcess?

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
    }
    
    @IBAction func runcamera(_ sender: Any) {
        myCamera = Camera()
        myCamera?.setMainUIView(argMainUIView: self)
        myCamera?.setCamera(argCameraSelector: CameraInDevice())
        
        myCaptureImage = CameraCaptureProcess()
        captureImageView?.contentMode = .scaleAspectFit
        myCaptureImage?.captureUIView = captureImageView
        myCamera?.setCaptureProcess(argCaptureProcess: myCaptureImage!)
        
        myCamera?.runCamera();

   

    }
    
    @IBAction func phooto(_ sender: Any) {
         myMedia = Media()
         myMediaSelect = MediaSelectProcess()

        myMedia?.setMainUIView(argMainUIView: self)
        myMedia?.setMedia(argMediaSelector: MediaInDevice())
        
        captureImageView?.contentMode = .scaleAspectFit
        myMediaSelect?.selectUIView = captureImageView
        
        myMedia?.setSelectProcess(argSelectProcess: myMediaSelect!)
        
        myMedia?.runMedia();

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

