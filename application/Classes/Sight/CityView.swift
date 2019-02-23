//
//  CityView.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/27.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class CityView: UIView{
    
    var city = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 168)
        self.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        let view = UIView(frame: CGRect(x: 0, y: 158, width: UIScreen.main.bounds.width, height: 10))
        view.backgroundColor = UIColor.white
        self.addSubview(view)
        
        //宽度自适应没有写
        city.frame = (CGRect(x: 30, y: 76, width: 100, height: 30))
        city.textColor = UIColor.white
        city.font = UIFont.boldSystemFont(ofSize: 30)
        self.addSubview(city)
        
        let button = UIButton(frame: CGRect(x: 100, y: 80, width: 20, height: 20))
        self.addSubview(button)
        button.setImage(UIImage(named: "down"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
