//
//  utilCamera.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/13.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit


class MediaSelectProcess : NSObject, MediaSelectProtocol, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var selectUIView: UIImageView?
    var selectImage: UIImage?
    //delegator
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        afterSelect(mediaData: info[UIImagePickerControllerOriginalImage])
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func afterSelect(mediaData: Any) {
        if let pickedImage = mediaData as? UIImage {
            self.selectImage = pickedImage
            self.selectUIView?.image = self.selectImage
            
        }
    }
}
