//
//  utilMedia.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/13.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit

protocol MediaProtocol {
    var selectProcess: AnyObject? { get set }
    
    func MediaStart(argMainUIView: UIViewController)
    //func capturePicture() -> String
}
