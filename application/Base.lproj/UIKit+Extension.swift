//
//  ss.swift
//  NewsTabbar
//
//  Created by jiayuqiang on 2018/8/9.
//  Copyright © 2018年 jiayuqiang. All rights reserved.
//

import UIKit

extension UIButton {
    
    public func initWithWordBUtton (rect:CGRect,color:UIColor,title:NSString,font:Int,wordColor:UIColor){
        
        self.frame                   = rect
        self.backgroundColor         = color
        self.titleLabel?.text        = title as String
        self.titleLabel?.font        = UIFont.systemFont(ofSize: CGFloat(font))
        self.titleLabel?.textColor   = wordColor
    }
}
