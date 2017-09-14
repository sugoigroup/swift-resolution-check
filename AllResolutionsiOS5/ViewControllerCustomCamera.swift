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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var myCamera: Camera?
        var myCaptureImage: CameraCaptureProcess?
        
        myCamera = Camera()
        myCamera?.setMainUIView(argMainUIView: self)
        myCamera?.setCamera(argCameraSelector: CameraInDevice())
        
        myCaptureImage = CameraCaptureProcess()
        self.captureImageView?.contentMode = .scaleAspectFit
        myCaptureImage?.captureUIView = self.captureImageView
        myCamera?.setCaptureProcess(argCaptureProcess: myCaptureImage!)
        
        myCamera?.runCamera();

        
        
    }
    
    @IBAction func runcamera(_ sender: Any) {
        var myCamera: Camera?
        var myCaptureImage: CameraCaptureProcess?

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
        let myMedia: Media? = Media()
        let myMediaSelect: MediaSelectProcess? = MediaSelectProcess()
        
        myMedia?.setMainUIView(argMainUIView: self)
        myMedia?.setMedia(argMediaSelector: MediaInDevice())
        
        captureImageView?.contentMode = .scaleAspectFit
        myMediaSelect?.selectUIView = captureImageView
        
       // myMedia?.setSelectProcess(argSelectProcess: myMediaSelect!)
        
        myMedia?.runMedia();

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

