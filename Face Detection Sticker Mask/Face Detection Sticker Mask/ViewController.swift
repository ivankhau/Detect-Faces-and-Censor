//
//  ViewController.swift
//  Face Detection Sticker Mask
//
//  Created by Ivan Khau on 3/31/16.
//  Copyright © 2016 PeerGoggles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stockImage: UIImageView!
    
    
    @IBAction func placeDog(sender: AnyObject) {
        
        let ciImage  = CIImage(CGImage:stockImage.image!.CGImage!)
        let ciDetector = CIDetector(ofType:CIDetectorTypeFace
            ,context:nil
            ,options:[
                CIDetectorAccuracy:CIDetectorAccuracyHigh,
                CIDetectorSmile:true
            ]
        )
        let markers = ciDetector.featuresInImage(ciImage)
        
        UIGraphicsBeginImageContext(stockImage.image!.size)
        stockImage.image!.drawInRect(CGRectMake(0,0,stockImage.image!.size.width,stockImage.image!.size.height))
        
        for marker in markers{
            
            let marker = marker as! CIFaceFeature
            
            let drawCtxt = UIGraphicsGetCurrentContext()
            
            // Face
            var faceRect = marker.bounds
            faceRect.origin.y = stockImage.image!.size.height - faceRect.origin.y - faceRect.size.height
            
            // to draw Dog Sticker
            let dogImg = UIImage(named:"dog.png")
            let mouthRectY = stockImage.image!.size.height - marker.mouthPosition.y
            let dogWidth  = faceRect.size.width
            let dogHeight = dogWidth
            let dogRect  = CGRectMake(marker.mouthPosition.x - dogWidth/1.6,mouthRectY - dogWidth/1,dogWidth*1.3,dogHeight*1.3)
            CGContextDrawImage(drawCtxt,dogRect,dogImg!.CGImage)
            
            // to draw box on mouth
            if((marker.hasMouthPosition) != false){
                let mouthRectY = stockImage.image!.size.height - marker.mouthPosition.y
                let mouthRect  = CGRectMake(marker.mouthPosition.x - 5,mouthRectY - 5,10,10)
                CGContextSetStrokeColorWithColor(drawCtxt,UIColor.greenColor().CGColor)
                CGContextStrokeRect(drawCtxt,mouthRect)
            }
            
            // to draw box on left eye
            if((marker.hasLeftEyePosition) != false){
                let leftEyeRectY = stockImage.image!.size.height - marker.leftEyePosition.y
                let leftEyeRect  = CGRectMake(marker.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                CGContextSetStrokeColorWithColor(drawCtxt, UIColor.greenColor().CGColor)
                CGContextStrokeRect(drawCtxt,leftEyeRect)
            }
            
            // to Draw box on right eye
            if((marker.hasRightEyePosition) != false){
                let rightEyeRectY = stockImage.image!.size.height - marker.rightEyePosition.y
                let rightEyeRect = CGRectMake(marker.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                CGContextSetStrokeColorWithColor(drawCtxt, UIColor.greenColor().CGColor)
                CGContextStrokeRect(drawCtxt,rightEyeRect)
            }
        }
        let updatedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        stockImage.image = updatedImage
        
    }
    
    @IBAction func placeStache(sender: AnyObject) {
        
        let ciImage  = CIImage(CGImage:stockImage.image!.CGImage!)
        let ciDetector = CIDetector(ofType:CIDetectorTypeFace
            ,context:nil
            ,options:[
                CIDetectorAccuracy:CIDetectorAccuracyHigh,
                CIDetectorSmile:true
            ]
        )
        let markers = ciDetector.featuresInImage(ciImage)
        
        UIGraphicsBeginImageContext(stockImage.image!.size)
        stockImage.image!.drawInRect(CGRectMake(0,0,stockImage.image!.size.width,stockImage.image!.size.height))
        
        for marker in markers{
            
            let marker = marker as! CIFaceFeature
            
            let drawCtxt = UIGraphicsGetCurrentContext()
            
            // Face
            var faceRect = marker.bounds
            faceRect.origin.y = stockImage.image!.size.height - faceRect.origin.y - faceRect.size.height
            
            // to draw Mustache
            let stacheImg = UIImage(named:"stache.png")
            let mouthRectY = stockImage.image!.size.height - marker.mouthPosition.y
            let stacheWidth  = faceRect.size.width * 4/5
            let stacheHeight = stacheWidth * 0.3
            let stacheRect  = CGRectMake(marker.mouthPosition.x - stacheWidth/2,mouthRectY - stacheHeight/2,stacheWidth,stacheHeight)
            CGContextDrawImage(drawCtxt,stacheRect,stacheImg!.CGImage)
            
            // to draw box on mouth
            // COULD USE MOUTH POSITION TO DRAW MOSTACHE ALSO.
            if((marker.hasMouthPosition) != false){
                let mouthRectY = stockImage.image!.size.height - marker.mouthPosition.y
                let mouthRect  = CGRectMake(marker.mouthPosition.x - 5,mouthRectY - 5,10,10)
                CGContextSetStrokeColorWithColor(drawCtxt,UIColor.greenColor().CGColor)
                CGContextStrokeRect(drawCtxt,mouthRect)
            }
            
            // to draw box on left eye
            if((marker.hasLeftEyePosition) != false){
                let leftEyeRectY = stockImage.image!.size.height - marker.leftEyePosition.y
                let leftEyeRect  = CGRectMake(marker.leftEyePosition.x - 5,leftEyeRectY - 5,10,10)
                CGContextSetStrokeColorWithColor(drawCtxt, UIColor.greenColor().CGColor)
                CGContextStrokeRect(drawCtxt,leftEyeRect)
            }
            
            // to Draw box on right eye
            if((marker.hasRightEyePosition) != false){
                let rightEyeRectY = stockImage.image!.size.height - marker.rightEyePosition.y
                let rightEyeRect = CGRectMake(marker.rightEyePosition.x - 5,rightEyeRectY - 5,10,10)
                CGContextSetStrokeColorWithColor(drawCtxt, UIColor.greenColor().CGColor)
                CGContextStrokeRect(drawCtxt,rightEyeRect)
            }
        }
        let updatedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        stockImage.image = updatedImage
        
    }
    
    
    @IBAction func undo(sender: AnyObject) {
        
        stockImage.image = UIImage(named: "stockphoto.png")
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}