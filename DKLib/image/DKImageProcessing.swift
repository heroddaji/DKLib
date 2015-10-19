//
//  FDImageProcessing.swift
//  FashionDisco
//
//  Created by daitran on 7/20/15.
//  Copyright © 2015 daitran. All rights reserved.
//

import UIKit

class DKImageProcessing{
    
    class func scaledImageToSize(image: UIImage, newSize: CGSize) -> UIImage{
        UIGraphicsBeginImageContext(newSize)
        image.drawInRect(CGRectMake(0 ,0, newSize.width, newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        return newImage
    }
    
    class func scaleImageByFactor(image:UIImage, scale:CGFloat) -> UIImage{
        
        let newWidth = image.size.width * scale
        let newHeight = image.size.height * scale
        let size = CGSizeMake(newWidth, newHeight)
        
        UIGraphicsBeginImageContext(size)
        image.drawInRect(CGRectMake(0, 0, size.width, size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
    
    
    class func compositeImage(images:[UIImage?], size: CGSize) -> UIImage{
        UIGraphicsBeginImageContext(size)
        for img in images{
            img!.drawInRect(CGRectMake(0, 0, size.width, size.height))
        }
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    
    class func getNetworkImageForImageViewScale( imageView:UIImageView, imageUrl:String, cropAndCenter:Bool = true, callback:(UIImage) -> Void)  {
        let url = NSURL(string: imageUrl)!
        //this method somehow blocks the changing image of uiimageview
        imageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "splash")) { (image, error, sdImageCacheType, url) -> Void in
       
            if image == nil{
                NSLog("error: cannot find download image")
                return
            }
            if cropAndCenter {
                
                var scaleH:CGFloat = 1
                var scaleW:CGFloat = 1
                //   FDLog("\(imageView.frame)")
                scaleH = imageView.frame.height / image.size.height
                scaleW = imageView.frame.width / image.size.width                
                
                var scale:CGFloat = 0
                if scaleW > scaleH{
                    scale = scaleW
                }else{
                    scale = scaleH
                }
                
                var newImage = UIImage()
                newImage = scaleImageByFactor(imageView.image!, scale: scale)
                
                imageView.image = newImage
                
                
                callback(newImage)
            }
        }
        
    }
    
    class func getNetworkImageForImageView(imageView:UIImageView, imageUrl:String, placeHolder:String = "splash") ->UIImageView{
        let url = NSURL(string: imageUrl)!
        imageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: placeHolder))
        return imageView
    }
    
}