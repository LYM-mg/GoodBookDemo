//
//  MGRankViewController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGRankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let centerLabel = UILabel()
        centerLabel.center = CGPointMake(MGScreen_Width/2, MGScreen_Height/2)
        centerLabel.textAlignment = .Center
        centerLabel.text = "沃日，真是帅啊，JR疯起来毫不讲理啊"
        centerLabel.frame.size.width = 300
        centerLabel.frame.size.height = 30
        centerLabel.numberOfLines = 0
        centerLabel.font = UIFont(name: MG_FONT, size: 16)
        self.view.addSubview(centerLabel)
        
        setUpNavgationBar()
    }

   
    private func setUpNavgationBar(){
        
    }
}
