//
//  MGPush_CatgoryController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGPush_CatgoryController: UIViewController {

    var segmentControl1: AKSegmentedControl?
    var segmentControl2: AKSegmentedControl?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = MG_RGB(240, g: 240, b: 240)
        
        let segmentLabel = UILabel(frame: CGRectMake((MGScreen_Width - 300)/2,30,300,20))
        segmentLabel.font = UIFont(name: MG_FONT, size: 20)
        segmentLabel.text = "请选择分类"
        segmentLabel.shadowOffset = CGSizeMake(0, 1)
        segmentLabel.shadowColor = UIColor.whiteColor()
        segmentLabel.textColor = MG_RGB(82, g: 113, b: 131)
        segmentLabel.textAlignment = .Center
        self.view.addSubview(segmentLabel)
        
        
        setUpsegmentControl()
    }
    
    // MARK:- 设置分类
    func setUpsegmentControl(){
        let buttonArray1 = [
            ["image":"ledger","title":"文学","font":MG_FONT],
            ["image":"drama masks","title":"人文社科","font":MG_FONT],
            ["image":"aperture","title":"生活","font":MG_FONT],
        ]
        segmentControl1 = AKSegmentedControl(frame: CGRectMake(20, 80, MGScreen_Width-40, 40))
        segmentControl1?.initButtonWithTitleandImage(buttonArray1)
        self.view.addSubview(segmentControl1!)
        
        
        let buttonArray2 = [
            ["image":"atom","title":"经管","font":MG_FONT],
            ["image":"alien","title":"科技","font":MG_FONT],
            ["image":"fire element","title":"网络流行","font":MG_FONT],
        ]
        segmentControl2 = AKSegmentedControl(frame: CGRectMake(20, 130, MGScreen_Width-40, 40))
        segmentControl2?.initButtonWithTitleandImage(buttonArray2)
        view.addSubview(segmentControl2!)
    }

    // MARK:- 按钮监听操作
    func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func sure(){
        print("发布")
    }

}
