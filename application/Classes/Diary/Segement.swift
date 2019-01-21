//
//  Segement.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/21.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit

class DiarySegement: UISegmentedControl {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.tintColor = UIColor.gray
        self.insertSegment(withTitle: "关注", at: 0, animated: true)
        self.insertSegment(withTitle: "热门", at: 1, animated: true)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
