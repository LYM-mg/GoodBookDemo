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
    }
    
    
    

    // MARK:- MGBookTitleViewDelegate
    func choiceBookCover() {
        
    }
}
