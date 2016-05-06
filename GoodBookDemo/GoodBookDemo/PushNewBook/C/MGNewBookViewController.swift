//
//  MGNewBookViewController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGNewBookViewController: UIViewController,MGBookTitleViewDelegate,MGPhotoSelectControllerDelegate{

    var bookTitleView: MGBookTitleView?
    var tableView: UITableView?
    var book_Title = ""
    
    var LD_Score: LDXScore?
    var isShowScore = false
    
    var type = "文学"
    var detaiType = "文学"

    
    var titleArray:Array<String> = ["标题","评分","分类","书评"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        // 添加bookTitleView
        bookTitleView = MGBookTitleView(frame: CGRectMake(0, 40, MGScreen_Width, 160))
        bookTitleView?.delegate = self
        self.view.addSubview(bookTitleView!)
        
        // 添加tableView 
        let tableView = UITableView(frame: CGRectMake(0, 200,MGScreen_Width,  MGScreen_Height-200), style: .Grouped)
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.view.addSubview(tableView)
        self.tableView = tableView
        
        // 添加评论
        let LD_Score = LDXScore(frame: CGRectMake(150, 10, 100, 30))
        LD_Score.isSelect = true
        LD_Score.normalImg = UIImage(named: "btn_star_evaluation_normal")
        LD_Score.highlightImg = UIImage(named: "btn_star_evaluation_press")
        LD_Score.show_star = 5
        LD_Score.show_score = 5
        self.LD_Score = LD_Score
        
    }
    
    // MARK:- 按钮监听操作
    func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func sure(){
        print("发布")
    }
    

    // MARK:- MGBookTitleViewDelegate
    func choiceBookCover() {
        let photoSelectController = MGPhotoSelectController()
        photoSelectController.delegate = self
        presentViewController(photoSelectController, animated: true, completion: nil)
    }
    
    // MARK:- MGPhotoSelectControllerDelegate
    func getImageFromPicker(image: UIImage) {
        bookTitleView?.bookCover?.setImage(image, forState: .Normal)
    }
}


// MARK:- UITableViewDataSource,UITableViewDelegate
let cellIdentifier = "cellIdentifier"
extension MGNewBookViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: cellIdentifier)
        /**
        *  移除cell中的所有内容
        */
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }

        if indexPath.row != 1 {
            cell.accessoryType = .DisclosureIndicator
        }else {
            cell.accessoryType = .None
        }
        
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.textLabel?.font = UIFont.systemFontOfSize(14)
        cell.detailTextLabel?.font = UIFont.systemFontOfSize(14)
        
        if isShowScore && indexPath.row == 2{
            cell.contentView.addSubview(self.LD_Score!)
        }
    
        switch indexPath.row{
            case 0:
                cell.detailTextLabel?.text = book_Title
                break
            case 1:
                
                break
            case 2:
                cell.detailTextLabel?.text = self.type + "->" + self.detaiType
                break
            case 3:
                break
            default:
                break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var row = indexPath.row
        if self.isShowScore && row >= 1 {
            row -= 1
        }
        
        switch row{
        case 0:
            tableViewSelectTitle()
            break
        case 1:
            tableViewSelectScore(row)
            break
        case 2:
            tableViewSelectCatgory()
            break
        case 3:
             tableViewSelectComment()
            break
        default:
            break
        }
    }

    // MARK:- 自定义方法
    /**
    *  选择标题
    */
    private func tableViewSelectTitle(){
        let vc = MGPush_TitleController()
        MGFactor().addTitleWithTitle(vc)
        vc.callBack = {[unowned self](title) in
            self.book_Title = title
            self.tableView?.reloadRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
        }
        presentViewController(vc, animated: true) { () -> Void in
            
        }
    }
    
    /**
    *  选择评分
    */
    func tableViewSelectScore(index: Int){
        /**
        *  插入cell移除cell的动画
        */
        self.tableView?.beginUpdates()
        let tempIndexPath = [NSIndexPath(forRow: 2, inSection: 0)]
        
        if self.isShowScore{
            self.titleArray.removeAtIndex(2)
            self.tableView?.deleteRowsAtIndexPaths(tempIndexPath, withRowAnimation: .Right)
            self.isShowScore = false
        }else{
            self.titleArray.insert("", atIndex: 2)
            self.tableView?.insertRowsAtIndexPaths(tempIndexPath, withRowAnimation: .Left)
            self.isShowScore = true
        }
        
        self.tableView?.endUpdates()
    }

    /**
    *  选择分类
    */
    private func tableViewSelectCatgory(){
        let vc = MGPush_CatgoryController()
        MGFactor().addTitleWithTitle(vc)
        let leftBtn = vc.view.viewWithTag(1000) as! UIButton
        let rightBtn = vc.view.viewWithTag(1001) as! UIButton
        leftBtn.setTitleColor(MG_RGB(39, g: 89, b: 99), forState: .Normal)
        rightBtn.setTitleColor(MG_RGB(39, g: 89, b: 99), forState: .Normal)
        
        // 顺传
        vc.type = self.type
        vc.detailType = self.detaiType
        
        // 逆传
        vc.callBack = {[unowned self](type: String, detailType: String) -> Void in
            self.type = type
            self.detaiType = detailType
            self.tableView?.reloadData()
        }

        presentViewController(vc, animated: true) { () -> Void in
            
        }
    }
    /**
    *  选择评论
    */
    private func tableViewSelectComment(){
        let vc = MGPush_CommentController()
        MGFactor().addTitleWithTitle(vc)
        presentViewController(vc, animated: true) { () -> Void in
            
        }
    }
}



