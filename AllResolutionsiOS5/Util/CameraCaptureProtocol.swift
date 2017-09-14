//
//  utilCamera.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/13.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit

protocol CameraCaptureProtocol {
    var captureUIView: UIImageView? { get set }
    var captureImage: UIImage? { get set }
    
    func afterCapture(captureData: Any)
    
}
