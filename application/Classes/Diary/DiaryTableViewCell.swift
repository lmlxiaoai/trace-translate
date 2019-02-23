//
//  DiaryTableCell.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/18.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class DiaryTableViewCell: UITableViewCell{
    
//    var Image = UIImage()
    var BackImage = UIImageView()
    var Title = UILabel()
    var LikeButton = UIButton()
    var StorageButton = UIButton()
    var ShareButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(BackImage)
        //BackImage.backgroundColor = UIColor.green
        BackImage.contentMode = UIView.ContentMode.scaleAspectFill
        BackImage.clipsToBounds = true
        BackImage.layer.cornerRadius = 6
        BackImage.layer.backgroundColor = UIColor.white.cgColor
        //style.layer.shadowColor = UIColor.lightGray.cgColor
        BackImage.layer.shadowRadius = 5
        BackImage.layer.shadowOpacity = 0.2
        BackImage.layer.shadowOffset = CGSize(width: 0, height: 3)
        BackImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(10)
            make.top.equalTo(self.snp.top).offset(6)
            make.right.equalTo(self.snp.right).offset(-10)
            make.bottom.equalTo(self.snp.bottom).offset(-6)
        }
        
        BackImage.addSubview(Title)
        Title.font = UIFont.boldSystemFont(ofSize:20)
        Title.textColor = UIColor.white
        Title.shadowColor = UIColor.black
        Title.shadowOffset = CGSize(width: 0.5, height: 0.5)
        Title.backgroundColor = .clear
        Title.lineBreakMode = NSLineBreakMode.byWordWrapping
        Title.numberOfLines = 3
        Title.sizeToFit()
        Title.snp.makeConstraints { (make) in
            make.left.equalTo(BackImage.snp.left).offset(14)
            make.top.equalTo(BackImage.snp.top).offset(14)
            make.size.equalTo(CGSize(width: 300, height: 60))
        }
        
        BackImage.addSubview(LikeButton)
        //self.addSubview(LikeButton)
        LikeButton.setImage(UIImage(named:"Like"), for: .normal)
        LikeButton.snp.makeConstraints { (make) in
            make.right.equalTo(BackImage.snp.right).offset(-87)
            make.bottom.equalTo(BackImage.snp.bottom).offset(-8)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        BackImage.addSubview(StorageButton)
        StorageButton.setImage(UIImage(named:"Storage"), for: .normal)
        StorageButton.snp.makeConstraints { (make) in
            make.right.equalTo(BackImage.snp.right).offset(-50)
            make.bottom.equalTo(BackImage.snp.bottom).offset(-8)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        BackImage.addSubview(ShareButton)
        //self.addSubview(ShareButton)
        //ShareButton.tintColor = UIColor.black
        ShareButton.setImage(UIImage(named:"Share"), for: .normal)
        ShareButton.snp.makeConstraints { (make) in
            make.right.equalTo(BackImage.snp.right).offset(-14)
            make.bottom.equalTo(BackImage.snp.bottom).offset(-8)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
