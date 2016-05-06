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
        if indexPath.row != 1 {
            cell.accessoryType = .DisclosureIndicator
        }
        
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.textLabel?.font = UIFont.systemFontOfSize(14)
        cell.detailTextLabel?.font = UIFont.systemFontOfSize(14)
        
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
            tableViewSelectScore()
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
        titleController.callBack = {(title) in
            self.book_Title = title
            self.tableView?.reloadRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Fade)
        }
        presentViewController(titleController, animated: true) { () -> Void in
            
        }
    }
    
    private func tableViewSelectScore(){
        
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



