//
//  ViewControllerCamera.swift
//  AllResolutionsiOS5
//
//  Created by きむ on 2017/09/12.
//  Copyright © 2017 applenote. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerCamera: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let captureSession = AVCaptureSession()
    var previewLayer: CALayer!
    
    var captureDevice:AVCaptureDevice!
    var takePhoto = false

    @IBOutlet weak var imageView: UIImageView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
        prepareCamera()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func fff(_ sender: Any) {
        takePhoto = true
    }
    
    
    func prepareCamera() {
        captureSession.sessionPreset = AVCaptureSessionPresetPhoto
        
        if let ableDevie = AVCaptureDeviceDiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .back).devices {
            captureDevice = ableDevie.first!
            beginSession()
        }
    }
    
    func beginSession () {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(captureDeviceInput)
        }catch{
            print(error.localizedDescription)
        }
        
        if let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession) {
            self.previewLayer = previewLayer
            self.view.layer.addSublayer(self.previewLayer)
            self.previewLayer.frame = imageView.layer.frame
            captureSession.startRunning()
            
            
            let dataOutput = AVCaptureVideoDataOutput()
            dataOutput.videoSettings = [(kCVPixelBufferPixelFormatTypeKey as NSString): NSNumber(value: kCVPixelFormatType_32BGRA)]
            dataOutput.alwaysDiscardsLateVideoFrames = true
            
            if captureSession.canAddOutput(dataOutput) {
                captureSession.addOutput(dataOutput)
            }
            
            captureSession.commitConfiguration()
            
            let queue = DispatchQueue(label: "com.my.queue")
            dataOutput.setSampleBufferDelegate(self , queue: queue)
        }
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!) {
        if takePhoto {
            takePhoto = false
            
            
            
            if let image = self.getImageFromSampleBuffer(sampleBuffer){
                DispatchQueue.main.async {
                    let photoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"PhotoVC") as! testPhotoView
                    photoVC.takenPhoto = image
                    DispatchQueue.main.async {
                        self.present(photoVC, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    func getImageFromSampleBuffer (_ sampleBuffer: CMSampleBuffer) -> UIImage?{
        // Sampling Bufferから画像を取得
        let imageBuffer:CVImageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
        
        // pixel buffer のベースアドレスをロック
        CVPixelBufferLockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: CVOptionFlags(0)))
        
        let baseAddress:UnsafeMutableRawPointer = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0)!
        
        let bytesPerRow:Int = CVPixelBufferGetBytesPerRow(imageBuffer)
        let width:Int = CVPixelBufferGetWidth(imageBuffer)
        let height:Int = CVPixelBufferGetHeight(imageBuffer)
        
        
        // 色空間
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        
        //let bitsPerCompornent:Int = 8
        // swift 2.0
        let newContext:CGContext = CGContext(data: baseAddress, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace,  bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue|CGBitmapInfo.byteOrder32Little.rawValue)!
        
        let imageRef:CGImage = newContext.makeImage()!
        let resultImage = UIImage(cgImage: imageRef, scale: 1.0, orientation: UIImageOrientation.right)
        
        return resultImage
    }
}
