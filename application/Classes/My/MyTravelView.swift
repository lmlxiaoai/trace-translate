//
//  MyTravelView.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/29.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MyTravelView : UIControl{
    
    var mytravellabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mytravellabel.text = "我的旅行"
        mytravellabel.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(mytravellabel)
        mytravellabel.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.left.equalTo(20)
            make.size.equalTo(CGSize(width: 100, height: 18))
        }
 
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        //line.backgroundColor = UIColor.black
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.top.equalTo(42)
            make.left.equalTo(12)
            make.size.equalTo(CGSize(width: 322, height: 1))
            
        }
        
        self.layer.cornerRadius = 8
        self.layer.backgroundColor = UIColor.white.cgColor
        //self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
