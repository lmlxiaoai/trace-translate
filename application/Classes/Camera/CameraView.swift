//
//  CameraView.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/25.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class CameraView: UIView {
    
    var ImageView: UIImageView!
    var LabelResults: UITextView!
    var LandmarkResults: UITextView!
    var textview:UITextView!
    var TextResults: UITextView!
    var ChooseButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        ChooseButton = UIButton()
        ChooseButton.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        self.addSubview(ChooseButton)
        ChooseButton.snp.makeConstraints { (make) in
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        ImageView = UIImageView()
        self.addSubview(ImageView)
        ImageView.contentMode = .scaleAspectFill
        ImageView.snp.makeConstraints { (make) in
            //make.centerX.equalToSuperview()
            make.left.right.top.bottom.equalTo(self)
            
        }
        
        
        
        TextResults = UITextView()
        ImageView.addSubview(TextResults)
        TextResults.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 0.5)
        /*
        let subjectString1 = NSAttributedString(string: "CLUD:  ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22)])
        
        TextResults.attributedText = subjectString1
 */
        TextResults.textColor = UIColor.white
        TextResults.font = UIFont.systemFont(ofSize: 38)
        TextResults.textAlignment = .center
        TextResults.snp.makeConstraints { (make) in
            //make.centerX.equalToSuperview()
            make.bottom.equalTo(ImageView.snp.bottom).offset(-100)
            make.height.equalTo(100)
            make.right.left.equalToSuperview().inset(24)
        }
        
        textview = UITextView()
        ImageView.addSubview(textview)
        textview.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 0.5)
        textview.textColor = UIColor.white
        textview.text = "识别结果："
        textview.font = UIFont.systemFont(ofSize: 22)
        //textview.textAlignment = .center
        textview.snp.makeConstraints { (make) in
            //make.centerX.equalToSuperview()
            make.bottom.equalTo(ImageView.snp.top)
            make.height.equalTo(22)
            make.right.left.equalTo(TextResults)
        }
        
        LandmarkResults = UITextView()
        //ImageView.addSubview(LandmarkResults)
        LandmarkResults.backgroundColor = UIColor.lightGray
        LandmarkResults.alpha = 0.5
        LandmarkResults.textColor = UIColor.white
        LandmarkResults.textAlignment = .center
        /*
        LandmarkResults.snp.makeConstraints{ (make) in
            make.right.left.equalTo(TextResults)
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(100)
            //make.top.equalTo(TextResults.snp.bottom).offset(20)
            //make.bottom.equalToSuperview().offset(40)
        }
        */
        
        /*
        ImageView.snp.makeConstraints { (make) in
            make.right.left.equalTo(self).inset(40)
        }
        */
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
