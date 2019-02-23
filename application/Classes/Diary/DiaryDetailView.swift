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
    var icon:UIImageView!
    
    
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
        self.layer.shadowRadius = 5
        BackImageView.backgroundColor = UIColor.gray
        BackImageView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self)
            make.height.equalTo(162)
        }
        
        Textlabel = UILabel()
        self.addSubview(Textlabel)
        Textlabel.numberOfLines = 0
        Textlabel.backgroundColor = UIColor.yellow
        
        Textlabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self).inset(20)
            make.top.equalTo(self).offset(200)
            //make.bottom.equalTo(scroll.snp.bottom).inset(10)
            //在controller里约束最下面
        }
        Textlabel.text = "88888888899990123891283091839021830198302918309138012938901238901238901238901238019283019283901283109238190240822370948751904856cn979my9x8r,3rmy398y938ry98cmry9832yr8m9x3ry98 y2mr9832ym98c23y4,984y38204y784x7803x"
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
