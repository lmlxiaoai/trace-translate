//
//  ViewController2.swift
//  NewsTabbar
//
//  Created by jiayuqiang on 2018/8/9.
//  Copyright © 2018年 jiayuqiang. All rights reserved.
//

import UIKit

class MapViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "地图"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Home_0"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(leftClick2))
    }

    @objc private func leftClick2() {
        print("did click right")
        
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(MapViewController(), animated: true)
        self.hidesBottomBarWhenPushed = false
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
