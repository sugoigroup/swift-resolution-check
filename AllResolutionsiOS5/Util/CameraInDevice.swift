//
//  utilCamera.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/13.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit


class CameraInDevice: NSObject,  CameraProtocol {

    var captureProcess: AnyObject?
    
    func cameraStart(argMainUIView: UIViewController) {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = captureProcess as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            //CameraCaptureProcess()
            argMainUIView.present(cameraPicker, animated: true, completion: nil)
            
        }
    }
}
