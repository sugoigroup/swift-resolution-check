//
//  Media.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/14.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit


class Media {
    //delegator
    var mediaSelector: MediaProtocol?
    var mainUIView: UIViewController?
    
    
    func setMainUIView(argMainUIView: UIViewController) {
        self.mainUIView = argMainUIView
    }
    
    func setMedia(argMediaSelector: MediaProtocol){
        self.mediaSelector = argMediaSelector
    }
    
    func runMedia() {
        mediaSelector?.MediaStart(argMainUIView:  self.mainUIView!)
    }
    
    func setSelectProcess(argSelectProcess: AnyObject) {
        mediaSelector?.selectProcess = argSelectProcess
    }
    
}

