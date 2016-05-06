//
//  MGRegistViewController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/7.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGRegistViewController: UIViewController {

    // MARK:- 属性
    @IBOutlet weak var accountField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var registBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    }
    

    
    // MARK: - 操作
    // 注册
    @IBAction func registBtnClick(sender: UIButton) {
        
        
    }
    
    // 关闭
    @IBAction func closeBtnClick() {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }


}
