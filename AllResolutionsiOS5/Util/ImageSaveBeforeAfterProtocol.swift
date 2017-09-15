//
//  utilCamera.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/13.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit

protocol ImageSaveBeforeAfterProtocol {
    func beforeSave()
    func afterSave(didFinishSavingWithError error: NSError!)
    
}
