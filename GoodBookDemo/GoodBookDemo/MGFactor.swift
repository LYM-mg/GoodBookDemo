//
//  MGFactor.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGFactor: NSObject {
    func addTitleWithTitle(target: UIViewController,leftTitle: String="关闭",rightTitle: String="确定") {
        let btn1 = UIButton(frame: CGRectMake(10, 20, 40, 30))
        btn1.setTitleColor(MAIN_Color, forState: .Normal)
        btn1.setTitle(leftTitle, forState: .Normal)
         btn1.titleLabel?.font = UIFont.systemFontOfSize(16)
        btn1.contentHorizontalAlignment = .Left
        btn1.addTarget(target, action: Selector("close"), forControlEvents: .TouchUpInside)
        target.view.addSubview(btn1)
        
        let btn2 = UIButton(frame: CGRectMake(MGScreen_Width - 10 - 40, 20, 40, 30))
        btn2.setTitleColor(MAIN_Color, forState: .Normal)
        btn2.setTitle(rightTitle, forState: .Normal)
        btn2.titleLabel?.font = UIFont.systemFontOfSize(16)
        btn2.contentHorizontalAlignment = .Right
        btn2.addTarget(target, action: Selector("sure"), forControlEvents: .TouchUpInside)
        target.view.addSubview(btn2)
    }
}
