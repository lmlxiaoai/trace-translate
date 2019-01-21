//
//  skin.swift
//  NewsTabbar
//
//  Created by jiayuqiang on 2018/8/8.
//  Copyright © 2018年 jiayuqiang. All rights reserved.
//

import UIKit

class skin: UIButton {

    //https://www.jianshu.com/p/bcaeb1ce9041
    //https://blog.csdn.net/zhengyanfeng1989/article/details/60867795
    
    public func initWithWordBUtton (rect:CGRect,color:UIColor,title:NSString,font:Int,wordColor:UIColor) -> UIButton {
        
        self.frame                   = rect
        self.backgroundColor         = color
        self.titleLabel?.text        = title as String
        self.titleLabel?.font        = UIFont.systemFont(ofSize: CGFloat(font))
        self.titleLabel?.textColor   = wordColor
        return self
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
