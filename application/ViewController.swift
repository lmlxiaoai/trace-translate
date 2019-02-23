//
//  ViewController.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/18.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        //Base64字符串
        let base64=""
        
        //获取图片数据
        let imageData = Data(base64Encoded: base64)
        
        //显示图片
        imageView.image = UIImage(data: imageData!)
        self.view.addSubview(imageView)

        // Do any additional setup after loading the view, typically from a nib.
    }


}

