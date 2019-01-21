//
//  PublishVoiceView.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/19.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class PublishVoiceView: UIView {
    
    let VoiceButton = UIButton()
    let VoiceResult = UITextView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(VoiceButton)
        VoiceButton.snp.makeConstraints { (make) in
            make.top.equalTo(422)
            make.size.equalTo(CGSize(width: 80, height: 80))
            make.centerX.equalTo(self)
        }
        VoiceButton.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        VoiceButton.layer.cornerRadius = 40
        VoiceButton.setImage(UIImage(named: "Voice"), for: .normal)
        VoiceButton.tintColor = UIColor.white
        
        
        VoiceResult.backgroundColor = UIColor.white
        VoiceResult.font = UIFont.systemFont(ofSize: 18.0)
        VoiceResult.layer.cornerRadius = 5
        //VoiceResult.borderStyle = UITextBorderStyleRoundedRect
        //VoiceResult.layer.borderColor =
        VoiceResult.layer.shadowColor = UIColor.lightGray.cgColor
        VoiceResult.layer.shadowRadius = 20
        VoiceResult.layer.shadowOpacity = 0.8
        VoiceResult.layer.borderWidth = 1.0
        self.addSubview(VoiceResult)
        VoiceResult.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            //make.size.equalTo(CGSize(width: self.frame.width-20, height: 356))
            make.size.equalTo(CGSize(width: UIScreen.main.bounds.size.width-20 , height: 356))
            make.centerX.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
