//
//  SelectStoryboardByIphoneType.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/11.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit

class StoryboardByScreenSize : ScreenSizeProtocol{
    func getStoryBoardBySizeType(SizeNickName: String) -> UIViewController {
        let viewController:UIViewController?
        let storyboard:UIStoryboard?
        let storyboardName:String?
        let storyboardIndicator:String?
        if SizeNickName  == "4s"
        {
            storyboardName = "Main"
            storyboardIndicator = "iPhone5Id"
        } else {
            storyboardName = "Main6"
            storyboardIndicator = "iPhone6Id"
        }
        
        storyboard = UIStoryboard(name: storyboardName!, bundle: nil)
        viewController =
            storyboard?.instantiateViewController(withIdentifier: storyboardIndicator!)
        
        return viewController!
    }
}
