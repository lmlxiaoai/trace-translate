//
//  DiaryDetailView.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/23.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class DiaryDetailView: UIView {
    
    var Textlabel: UILabel!
    var BackImageView:UIImageView!
    var Icon:UIImageView!
    var Name:UILabel!
    var Motto:UILabel!
    var line1:UIView!
    var Title:UILabel!
    var line2:UIView!
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
    
        self.layer.cornerRadius = 6
        self.layer.backgroundColor = UIColor.white.cgColor
        //style.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        //self.clipsToBounds = true
        
        BackImageView = UIImageView()
        self.addSubview(BackImageView)
        BackImageView.contentMode = UIView.ContentMode.scaleAspectFill
        BackImageView.clipsToBounds = true
        BackImageView.layer.cornerRadius = 5
        BackImageView.backgroundColor = UIColor.lightGray
        BackImageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(162)
        }
        
        Icon = UIImageView()
        self.addSubview(Icon)
        Icon.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        Icon.clipsToBounds = true
        Icon.layer.cornerRadius = 21
        Icon.contentMode = UIView.ContentMode.scaleAspectFill
        Icon.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(12)
            make.top.equalTo(BackImageView.snp.bottom).offset(12)
            make.width.height.equalTo(42)
        }
        
        Name = UILabel()
        self.addSubview(Name)
        Name.snp.makeConstraints { (make) in
            make.left.equalTo(Icon.snp.right).offset(12)
            make.top.equalTo(BackImageView.snp.bottom).offset(14)
            make.width.equalTo(200)
        }
        
        Motto = UILabel()
        self.addSubview(Motto)
        Motto.textColor = UIColor.gray
        Motto.snp.makeConstraints { (make) in
            make.left.equalTo(Icon.snp.right).offset(12)
            make.top.equalTo(Name.snp.bottom).offset(4)
            make.width.equalTo(200)
        }
        
        line1 = UIView()
        self.addSubview(line1)
        line1.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        line1.snp.makeConstraints { (make) in
            make.left.right.equalTo(self).inset(10)
            make.top.equalTo(Icon.snp.bottom).offset(12)
            make.height.equalTo(1)
        }
        
        Title = UILabel()
        self.addSubview(Title)
        Title.font = UIFont.systemFont(ofSize:23)
        Title.lineBreakMode = NSLineBreakMode.byWordWrapping
        Title.numberOfLines = 0
        //Title.sizeToFit()
        Title.snp.makeConstraints { (make) in
            make.left.right.equalTo(self).inset(18)
            make.top.equalTo(line1.snp.bottom).offset(19)
            
           
        }
        
        let publishlabel = UILabel()
        self.addSubview(publishlabel)
        publishlabel.text = "发表于"
        publishlabel.font = UIFont.systemFont(ofSize:10)
        publishlabel.textColor = UIColor.gray
        publishlabel.snp.makeConstraints { (make) in
            make.left.equalTo(Title.snp.left)
            make.top.equalTo(Title.snp.bottom).offset(16)
            
        }
        
        Textlabel = UILabel()
        self.addSubview(Textlabel)
        Textlabel.numberOfLines = 0
        Textlabel.backgroundColor = UIColor.white
        Textlabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self).inset(20)
            make.top.equalTo(Title.snp.bottom).offset(45)
            //make.bottom.equalTo(scroll.snp.bottom).inset(10)
            //在controller里约束最下面
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
