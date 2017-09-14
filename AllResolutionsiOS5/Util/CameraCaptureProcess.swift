//
//  utilCamera.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/13.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit


class CameraCaptureProcess : NSObject, CameraCaptureProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var captureUIView: UIImageView?
    var captureImage: UIImage?
    //delegator
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        afterCapture(captureData: info[UIImagePickerControllerOriginalImage])
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func afterCapture(captureData: Any) {
        if let pickedImage = captureData as? UIImage {
            self.captureImage = pickedImage
            self.captureUIView?.image = self.captureImage
            
        }
    }
}
