//
//  MGPush_TitleController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

//typealias Push_TitlecallBack = ((titlt: String)->())

class MGPush_TitleController: UIViewController {
    
    var titleField: UITextField?
    // 定义一个闭包属性
    var callBack: ((title: String)->())?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let titleField = UITextField(frame: CGRectMake(20, 80, MGScreen_Width-40, 30))
        titleField.font = UIFont.systemFontOfSize(16)
        titleField.textColor = UIColor.blackColor()
        titleField.placeholder = "标题名称"
        titleField.borderStyle = .RoundedRect
        titleField.clearButtonMode = .WhileEditing
        self.view.addSubview(titleField)
        self.titleField = titleField
        
        self.titleField?.becomeFirstResponder()
    }

    // MARK:- 按钮监听操作
    func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func sure(){
        self.view.endEditing(true)
        callBack!(title: (self.titleField?.text)!)
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    
}
