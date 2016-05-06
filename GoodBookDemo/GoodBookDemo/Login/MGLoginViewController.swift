//
//  MGLoginViewController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/7.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGLoginViewController: UIViewController{

    // MARK:- 属性
    /** 账号 */
    @IBOutlet weak var accountField: UITextField!
    /** 密码 */
    @IBOutlet weak var passwordField: UITextField!
    /** 登录按钮 */
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var topLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MGNotificationCenter.addObserver(self, selector: Selector("keyboardDidHide"), name: UIKeyboardDidHideNotification, object: nil)
        MGNotificationCenter.addObserver(self, selector: Selector("keyboardDidShow"), name: UIKeyboardDidShowNotification, object: nil)
    }

    // MARK:- 操作
    // 登录
    @IBAction func loginBtnClick(sender: UIButton) {
        AVUser.logInWithUsernameInBackground(self.accountField.text, password: self.passwordField.text) { (user, error) -> Void in
            if error == nil {
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            }else{
                if error.code == 210{
                    ProgressHUD.showError("用户名或密码错误")
                }else if error.code == 211 {
                    ProgressHUD.showError("不存在该用户")
                }else if error.code == 216 {
                    ProgressHUD.showError("未验证邮箱")
                }else if error.code == 1{
                    ProgressHUD.showError("操作频繁")
                }else{
                    ProgressHUD.showError("登录失败")
                }
            }
        }
    }
    
    // MARK:- 注册键盘出现和消失
    func keyboardDidShow() {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.topLayout.constant = -200
            self.view.layoutIfNeeded()
        }
    }
    
    func keyboardDidHide() {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.topLayout.constant = 15
            self.view.layoutIfNeeded()
        }
    }
}

