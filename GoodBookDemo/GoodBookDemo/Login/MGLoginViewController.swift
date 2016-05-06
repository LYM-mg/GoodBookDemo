//
//  MGLoginViewController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/7.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGLoginViewController: UIViewController,UITextFieldDelegate{

    // MARK:- 属性
    /** 账号 */
    @IBOutlet weak var accountField: UITextField!
    /** 密码 */
    @IBOutlet weak var passwordField: UITextField!
    /** 登录按钮 */
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        accountField.delegate = self
        passwordField.delegate = self
    }
    
    // MARK:- UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
        
    }

    // MARK:- 操作
    // 登录
    @IBAction func loginBtnClick(sender: UIButton) {
        
    }
}

