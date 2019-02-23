//
//  PublishView.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/21.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class PublishButtonView : UIView{
    
    let PublishPicButton = UIButton()
    let PublishVoiButton = UIButton()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue
        self.alpha = 0.5
        //self.backgroundColor = UIColor(red: 0 / 255.0, green: 0 / 255.0, blue: 0 / 255.0, alpha: 0.5)
        PublishPicButton.frame = CGRect(x: 200, y: 0, width: 80, height: 80)
        PublishPicButton.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        PublishPicButton.setImage(UIImage(named:"sight"), for: .normal)
        self.addSubview(PublishPicButton)
        
        
        PublishVoiButton.frame = CGRect(x: 100, y: 100, width: 80, height: 180)
        PublishVoiButton.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        PublishPicButton.setImage(UIImage(named:"sight"), for: .normal)
        self.addSubview(PublishPicButton)
        
        
    }
    
    @objc func handleSingleTapGesture() {
        
        print("ss")
        //publishview.removeFromSuperview() // 点击移除半透明的View
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

