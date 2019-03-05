//
//  SightDetailView.swift
//  application
//
//  Created by lmlxiaoai on 2019/3/3.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation

import UIKit

class SightDetailView: UIView {
    
    var Textlabel: UILabel!
    var textstring:String = "      景点简介\n"
    
    var Ticketlabel:UILabel!
    var Ticketstring:String = "      门票价格\n"
    
    var Trafficlabel:UILabel!
    var trafficlstring:String = "      交通方式\n"
    
    var BackImageView:UIImageView!
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
        
        Title = UILabel()
        self.addSubview(Title)
        Title.font = UIFont.boldSystemFont(ofSize:23)
        Title.lineBreakMode = NSLineBreakMode.byWordWrapping
        Title.numberOfLines = 0
        //Title.sizeToFit()
        Title.snp.makeConstraints { (make) in
            make.left.right.equalTo(self).inset(18)
            make.top.equalTo(BackImageView.snp.bottom).offset(19)
            
        }

        line1 = UIView()
        self.addSubview(line1)
        line1.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        line1.snp.makeConstraints { (make) in
            make.left.right.equalTo(self).inset(10)
            make.top.equalTo(Title.snp.bottom).offset(12)
            make.height.equalTo(1)
        }

        
        Textlabel = UILabel()
        self.addSubview(Textlabel)
        Textlabel.numberOfLines = 0
        Textlabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self).inset(20)
            make.top.equalTo(Title.snp.bottom).offset(45)
        
        }

        let point1 = GreenPoint(frame: CGRect(x: 0, y: 4, width: 16, height: 16))
        Textlabel.addSubview(point1)

        Ticketlabel = UILabel()
        self.addSubview(Ticketlabel)
        Ticketlabel.numberOfLines = 0
        Ticketlabel.backgroundColor = UIColor.white
        Ticketlabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(Textlabel)
            make.top.equalTo(Textlabel.snp.bottom).offset(20)
            
        }
        
        let point2 = GreenPoint(frame: CGRect(x: 0, y: 4, width: 16, height: 16))
        Ticketlabel.addSubview(point2)
        
        Trafficlabel = UILabel()
        self.addSubview(Trafficlabel)
        Trafficlabel.numberOfLines = 0
        Trafficlabel.backgroundColor = UIColor.white
        Trafficlabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(Textlabel)
            make.top.equalTo(Ticketlabel.snp.bottom).offset(20)
            
        }
        
        let point3 = GreenPoint(frame: CGRect(x: 0, y: 4, width: 16, height: 16))
        Trafficlabel.addSubview(point3)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class GreenPoint:UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        //self.frame.size = CGSize(width: 20, height: 20)
        self.layer.cornerRadius = self.frame.size.width/2;
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
