//
//  MGPushViewController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGPushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        setUpNavgationBar()
    }
    
    // 设置导航条
    private func setUpNavgationBar(){
        let navgationView = UIView(frame: CGRectMake(0, -20, MGScreen_Width, 65))
        navgationView.backgroundColor = UIColor.whiteColor()
        navigationController?.navigationBar.addSubview(navgationView)
        
        let addBtn = UIButton(frame: CGRectMake(20, 20, MGScreen_Width, 45))
        addBtn.setImage(UIImage(named: ""), forState: .Normal)
        addBtn.setTitle("   新建书评 ", forState: .Normal)
        addBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        addBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        addBtn.contentHorizontalAlignment = .Left  // 按钮文字居左
        
        addBtn.addTarget(self, action: "pushNewBook", forControlEvents: .TouchUpInside)
        
        navgationView.addSubview(addBtn)
    }
    
    @objc func pushNewBook(){
        
    }

}
