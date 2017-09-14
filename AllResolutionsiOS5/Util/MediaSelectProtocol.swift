//
//  utilCamera.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/13.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit

protocol MediaSelectProtocol {
    var selectUIView: UIImageView? { get set }
    var selectImage: UIImage? { get set }
    
    func afterSelect(mediaData: Any)
    
}
