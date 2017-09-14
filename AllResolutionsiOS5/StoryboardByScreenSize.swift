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
    
    func getIphoneTypeByScreenSize() -> String {
        var sizeType: String!
        // determine screen size
        switch UIScreen.main.bounds.size.height {
            // iPhone 4s
            case 480:
                sizeType = "4s"
            // iPhone 5s
            case 568:
                sizeType = "5s"
            // iPhone 6
            case 667:
                sizeType = "6"
            // iPhone 6 Plus
            case 736:
                sizeType = "6p"
            default:
                // it's an iPad
                sizeType = "ipad"
        }
        return sizeType;
    }
}
