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
    
    @IBOutlet weak var topLayout: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        MGNotificationCenter.addObserver(self, selector: Selector("keyboardDidHide"), name: UIKeyboardDidHideNotification, object: nil)
        MGNotificationCenter.addObserver(self, selector: Selector("keyboardDidShow"), name: UIKeyboardDidShowNotification, object: nil)
        
    }
    

    
    // MARK: - 操作
    // 注册
    @IBAction func registBtnClick(sender: UIButton) {
        let user = AVUser()
        user.username = self.accountField.text
        user.password = self.passwordField.text
        user.email = self.emailField.text
        user.signUpInBackgroundWithBlock { (successed, error) -> Void in
            if successed {
                ProgressHUD.showSuccess("注册成功，请验证邮箱")
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    
                })
            }else {
                if error.code == 125 {
                    ProgressHUD.showError("邮箱不合法")
                }else if error.code == 203 {
                    ProgressHUD.showError("该邮箱已注册")
                }else if error.code == 202 {
                    ProgressHUD.showError("用户名已存在")
                }else{
                    ProgressHUD.showError("注册失败")
                }
            }
        }
    }
    
    // 关闭
    @IBAction func closeBtnClick() {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }


    // MARK:- 注册键盘出现和消失
    func keyboardDidShow() {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.topLayout.constant = -180
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
