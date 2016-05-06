//
//  MGNewBookViewController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGNewBookViewController: UIViewController ,MGBookTitleViewDelegate{

    var bookTitleView: MGBookTitleView?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        bookTitleView = MGBookTitleView(frame: CGRectMake(0, 40, MGScreen_Width, 160))
        bookTitleView?.delegate = self
        self.view.addSubview(bookTitleView!)
    }
    
    // 按钮监听操作
    func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func sure(){
        print("发布")
    }
    

    // MARK:- MGBookTitleViewDelegate
    func choiceBookCover() {
        
    }
}
