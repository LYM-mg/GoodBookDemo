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
    var isShowStar = false
    
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
        
        if isShowStar && indexPath.row == 2{
            cell.contentView.addSubview(self.LD_Score!)
        }
        
        switch indexPath.row{
            case 0:
                cell.detailTextLabel?.text = book_Title
                break
            case 1:
                
                break
            case 2:
                break
            case 3:
                break
            default:
                break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row{
        case 0:
            tableViewSelectTitle()
            break
        case 1:
            tableViewSelectScore(indexPath.row)
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
    private func tableViewSelectTitle(){
        let titleController = MGPush_TitleController()
        MGFactor().addTitleWithTitle(titleController)
        titleController.callBack = {[unowned self](title) in
            self.book_Title = title
            self.tableView?.reloadRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
        }
        presentViewController(titleController, animated: true) { () -> Void in
            
        }
    }
    
    private func tableViewSelectScore(index: Int){
         let tempIndexPath = NSIndexPath(forRow: index+1, inSection: 0)
        self.tableView?.beginUpdates()
        if isShowStar {
            self.titleArray.removeAtIndex(index+1)
            self.tableView?.deleteRowsAtIndexPaths([tempIndexPath], withRowAnimation: .Left)
            self.tableView?.reloadData()
            isShowStar = false
        }else {
            self.titleArray.insert("", atIndex: index+1)
            self.tableView?.insertRowsAtIndexPaths([tempIndexPath], withRowAnimation: .Right)
            self.tableView?.reloadData()
            isShowStar = true
        }
        self.tableView?.endUpdates()
    }

    
    private func tableViewSelectCatgory(){
        let catgoryController = MGPush_CatgoryController()
        MGFactor().addTitleWithTitle(catgoryController)
        presentViewController(catgoryController, animated: true) { () -> Void in
            
        }
    }

    private func tableViewSelectComment(){
        let commentController = MGPush_CommentController()
        MGFactor().addTitleWithTitle(commentController)
        presentViewController(commentController, animated: true) { () -> Void in
            
        }
    }
}



