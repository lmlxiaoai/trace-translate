//
//  PublishViewController.swift
//  NewsTabbar
//
//  Created by lmlxiaoai on 2019/1/17.
//  Copyright © 2019 jiayuqiang. All rights reserved.
//

import Foundation
import UIKit

class PublishViewController: UIViewController {
    
    let PublishPicButton = UIButton()
    let PublishVoiButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.alpha = 0.5
        PublishPicButton.frame = CGRect(x: 200, y: 0, width: 80, height: 80)
        PublishPicButton.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        PublishPicButton.setImage(UIImage(named:"sight"), for: .normal)
        self.view.addSubview(PublishPicButton)
        
        
        PublishVoiButton.frame = CGRect(x: 100, y: 100, width: 80, height: 80)
        PublishVoiButton.backgroundColor = UIColor(red: 184.0 / 255.0, green: 206.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        PublishPicButton.setImage(UIImage(named:"sight"), for: .normal)
        self.view.addSubview(PublishVoiButton)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

