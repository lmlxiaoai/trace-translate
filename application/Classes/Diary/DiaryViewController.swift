//
//  Diary.swift
//  application
//
//  Created by lmlxiaoai on 2019/1/18.
//  Copyright © 2019 lmlxiaoai. All rights reserved.
//

import UIKit

class DiaryViewController: BaseViewController {
    
    let segement = DiarySegement(frame: CGRect(x: 0, y: 0, width: 180, height: 30))
    //let scrollview = DiaryScrollView(frame: UIScreen.main.bounds)
    let scrollview = DiaryScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = segement
        scrollview.frame = self.view.bounds
        self.segement.addTarget(self, action: #selector(segmentValueChange), for: UIControl.Event.valueChanged)
        self.view.addSubview(scrollview)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func segmentValueChange(){
        if (self.segement.selectedSegmentIndex == 0){
            //self.view.removeFromSuperview()
            self.scrollview.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        else{
            self.scrollview.setContentOffset(CGPoint(x: UIScreen.main.bounds.width, y: 0), animated: true)
        }
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
