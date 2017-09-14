//
//  utilMedia.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/13.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit


class MediaInDevice: NSObject,  MediaProtocol {

    var selectProcess: AnyObject?
    
    func MediaStart(argMainUIView: UIViewController) {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            // インスタンスの作成
            let mediaPicker = UIImagePickerController()
            mediaPicker.sourceType = sourceType
            mediaPicker.delegate = selectProcess as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            
            argMainUIView.present(mediaPicker, animated: true, completion: nil)
            
        }
    }
}
