//
//  KiClipperHelper.swift
//  application
//
//  Created by lmlxiaoai on 2019/3/5.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

private let shareManager = KiClipperHelper()
typealias clippedImageHandlerBlock = (_ img:UIImage)->Void
class KiClipperHelper: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    class var sharedInstance : KiClipperHelper {  //单例---工具类
        return shareManager
    }
    
    public var clippedImageHandler:clippedImageHandlerBlock? //裁剪结束回调
    public var systemEditing = false // 系统方式获取图片时, 是否允许系统编辑裁剪
    public var isSystemType = false //是否系统方式获取图片
    public var clippedImgSize:CGSize?  //自定义裁剪的尺寸
    public weak var nav:UINavigationController? //当前导航
    public var clipperType:ClipperType = .Move //裁剪框移动类型 (move图片移动, stay裁剪框移动)
    
    public func photoWithSourceType(type:UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = type
        imagePicker.allowsEditing = systemEditing
        //        imagePicker.modalTransitionStyle = .crossDissolve
        nav?.present(imagePicker, animated: true, completion: nil)
    }
    
    //MARK UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if !isSystemType { //自定义裁剪
            let image:UIImage = self.turnImageWithInfo(info: info) as UIImage
            let clipperVC = KiImageClipperViewController()
            clipperVC.setBaseImg(image, resultImgSize: clippedImgSize!, type: clipperType)
            clipperVC.cancelClippedHandler = {
                picker.dismiss(animated: true, completion: nil)
            }
            clipperVC.successClippedHandler = {[weak self]img in
                if self?.clippedImageHandler != nil{
                    self?.clippedImageHandler!(img)
                }
                picker.dismiss(animated: true, completion: nil)
            }
            picker.pushViewController(clipperVC, animated: true)
        }else{ //系统获取
            if !self.systemEditing{
                image = self.turnImageWithInfo(info: info)
            }else{
                image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            }
            if clippedImageHandler != nil{
                clippedImageHandler!(image ?? UIImage())
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    private var image:UIImage?
    
    private func turnImageWithInfo(info:[UIImagePickerController.InfoKey : Any]) -> UIImage {
        var image:UIImage? = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        //类型为 UIImagePickerControllerOriginalImage 时调整图片角度
        let type = info[UIImagePickerController.InfoKey.mediaType] as? String
        
        if type == "public.image" {
            let imageOrientation = image?.imageOrientation
            if imageOrientation != UIImage.Orientation.up{
                // 原始图片可以根据照相时的角度来显示，但 UIImage无法判定，于是出现获取的图片会向左转90度的现象。
                UIGraphicsBeginImageContext((image?.size)!)
                image?.draw(in: CGRect(x: 0, y: 0, width: (image?.size.width)!, height: (image?.size.height)!))
                image = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
            }
        }
        return image!
    }
    
    
}
