//
//  utilCamera.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/13.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit


class Camera {
    //delegator
    var cameraSelector: CameraProtocol?
    var mainUIView: UIViewController?
    
    
    func setMainUIView(argMainUIView: UIViewController) {
        self.mainUIView = argMainUIView
    }
    
    func setCamera(argCameraSelector: CameraProtocol){
        self.cameraSelector = argCameraSelector
    }
    
    func runCamera() {
        cameraSelector?.cameraStart(argMainUIView:  self.mainUIView!)
    }
    
    func setCaptureProcess(argCaptureProcess: AnyObject) {
        cameraSelector?.captureProcess = argCaptureProcess
    }

}
