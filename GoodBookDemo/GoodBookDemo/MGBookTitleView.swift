//
//  MGBookTitleView.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

@objc protocol MGBookTitleViewDelegate: NSObjectProtocol {
    optional func choiceBookCover()
}

class MGBookTitleView: UIView {
    
    var bookCover: UIButton?
    var bookName: UITextField?
    var bookEditor: UITextField?
    var delegate: MGBookTitleViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
     
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- 内部控制方法
    func setUpUI(){
        bookCover = UIButton(frame: CGRectMake(10, 8, 110, 140))
        bookCover?.setImage(UIImage(named: "chat_photo"), forState: .Normal)
        bookCover?.addTarget(self, action: Selector("changebookCover"), forControlEvents: .TouchUpInside)
        
        let bookNameX = CGRectGetMaxX((bookCover?.frame)!) + 20
        bookName = UITextField(frame: CGRectMake(bookNameX, 48, MGScreen_Width - bookNameX, 30))
        bookName?.placeholder = "请输入书名"
        
        bookEditor = UITextField(frame: CGRectMake(bookNameX, 48 + 30 + 40, MGScreen_Width - bookNameX, 30))
        bookEditor?.placeholder = "请输入作者的名字"
        
        
        self.addSubview(bookCover!)
        self.addSubview(bookName!)
        self.addSubview(bookEditor!)
    }
    
    func changebookCover(){
        delegate!.choiceBookCover!()
    }
}
