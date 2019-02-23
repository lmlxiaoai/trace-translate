//
//  WordView.swift
//  application
//
//  Created by lmlxiaoai on 2019/2/2.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class WordView : UIView{
    
    var InputView = UIView()
    var OutputView = UIView()
    var InContryImg = UIButton()
    var OutContryImg = UIButton()
    var ChangeButton = UIButton()
    var SayButton = UIButton()
    var PlayButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        InputView.layer.cornerRadius = 8
        InputView.layer.backgroundColor = UIColor.white.cgColor
        //InputView.layer.shadowColor = UIColor.lightGray.cgColor
        InputView.layer.shadowRadius = 5
        InputView.layer.shadowOpacity = 0.2
        InputView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.addSubview(InputView)
        
        InputView.snp.makeConstraints { (make) in
            // 距离父视图顶部
            make.top.equalTo(24)
            // 设置视图大小
            make.size.equalTo(CGSize(width: 350, height: 236))
            // x轴方向上居中
            make.centerX.equalToSuperview()
        }
 
        
        OutputView.layer.cornerRadius = 8
        OutputView.layer.backgroundColor = UIColor.white.cgColor
        //InputView.layer.shadowColor = UIColor.lightGray.cgColor
        OutputView.layer.shadowRadius = 5
        OutputView.layer.shadowOpacity = 0.2
        OutputView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.addSubview(OutputView)
        OutputView.snp.makeConstraints { (make) in
            // 距离父视图顶部
            make.top.equalTo(302)
            // 设置视图大小
            make.size.equalTo(CGSize(width: 350, height: 236))
            // x轴方向上居中
            make.centerX.equalToSuperview()
        }
        
        self.addSubview(ChangeButton)
        ChangeButton.backgroundColor = UIColor.white
        ChangeButton.setImage(UIImage(named:"Change"), for: .normal)
        //ChangeButton.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        ChangeButton.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

        ChangeButton.layer.cornerRadius = 36
        ChangeButton.layer.shadowRadius = 5
        ChangeButton.layer.shadowOpacity = 0.2
        ChangeButton.snp.makeConstraints{ (make) in
            make.top.equalTo(252)
            make.size.equalTo(CGSize(width: 78, height: 78))
            make.centerX.equalToSuperview()
        }
        /*
        InContryImg.layer.cornerRadius = 24
        InContryImg.backgroundColor = UIColor.black
        self.addSubview(InContryImg)
        InContryImg.snp.makeConstraints{ (make) in
            make.top.equalTo(inputView!).offset(20)
            make.size.equalTo(CGSize(width: 48, height: 48))
            make.centerX.equalToSuperview()
        }
        InContryImg.clipsToBounds = true
        */
        OutContryImg.backgroundColor = UIColor.black
        OutContryImg.layer.cornerRadius = 24
        self.addSubview(OutputView)
        OutContryImg.snp.makeConstraints{ (make) in
            make.top.equalTo(OutputView).offset(20)
            make.size.equalTo(CGSize(width: 48, height: 48))
            make.centerX.equalToSuperview()
        }
        OutContryImg.clipsToBounds = true
        
        //
        SayButton.backgroundColor = UIColor.white
        self.addSubview(SayButton)
        SayButton.setImage(UIImage(named: "Voice"), for: .normal)
        SayButton.snp.makeConstraints{ (make) in
            make.top.equalTo(OutputView).offset(20)
            make.size.equalTo(CGSize(width: 48, height: 48))
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
