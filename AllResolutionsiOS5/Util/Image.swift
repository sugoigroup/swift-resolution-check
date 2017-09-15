//
//  Media.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/14.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit


class Image:NSObject {
    //delegator
    var imageFilter: ImageFilterProtocol?
    private var imageData: AnyObject?
    var imageExifInfo: [String: String] = [:]
    
    var imageSaveBeforeAfter: ImageSaveBeforeAfterProtocol?
    
    func setImageFormat(argFormat: String) {
        self.imageExifInfo["format"] = argFormat
    }
    
    
    func convertUIImage(){
        if let saveImageData = self.imageData as? UIImage {
            self.imageData = saveImageData
        }
    }
    
    func setImageData(argImageData:AnyObject){
        self.imageData = argImageData
    }
    
    func getImageData() -> AnyObject{
        return self.imageData!
    }
    
    func saveToPhotoAlbum () {
        if let saveImageData = self.getImageData() as? UIImage {
            UIImageWriteToSavedPhotosAlbum(
                saveImageData,
                self,
                #selector(afterSaveForSelector(_:didFinishSavingWithError:contextInfo:)),
                nil
            )
        }
    }
    
    @objc func afterSaveForSelector (_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        imageSaveBeforeAfter?.afterSave(didFinishSavingWithError: error)
    }
}

