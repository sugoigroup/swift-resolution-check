//
//  utilCamera.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/13.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit

protocol CameraProtocol {
    var captureProcess: AnyObject? { get set }
    
    func cameraStart(argMainUIView: UIViewController)
    //func capturePicture() -> String
}
