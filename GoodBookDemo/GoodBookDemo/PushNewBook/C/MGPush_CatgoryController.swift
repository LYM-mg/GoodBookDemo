//
//  MGPush_CatgoryController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

class MGPush_CatgoryController: UIViewController,IGLDropDownMenuDelegate{

    var segmentControl1: AKSegmentedControl?
    var segmentControl2: AKSegmentedControl?
    
    var literatureArray1:Array<NSDictionary> = []
    var literatureArray2:Array<NSDictionary> = []
    
    
    var humanitiesArray1:Array<NSDictionary> = []
    var humanitiesArray2:Array<NSDictionary> = []
    
    
    var livelihoodArray1:Array<NSDictionary> = []
    var livelihoodArray2:Array<NSDictionary> = []
    
    
    var economiesArray1:Array<NSDictionary> = []
    var economiesArray2:Array<NSDictionary> = []
    
    
    var technologyArray1:Array<NSDictionary> = []
    var technologyArray2:Array<NSDictionary> = []
    
    var NetworkArray1:Array<NSDictionary> = []
    var NetworkArray2:Array<NSDictionary> = []
    
    var dropDownMenu1: IGLDropDownMenu?
    var dropDownMenu2: IGLDropDownMenu?
    
    var type = "文学"
    var detailType = "文学"
    var callBack: ((type:String,detailType:String) -> ())?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = MG_RGB(240, g: 240, b: 240)
        
        let segmentLabel = UILabel(frame: CGRectMake((MGScreen_Width - 300)/2,30,300,20))
        segmentLabel.font = UIFont(name: MG_FONT, size: 20)
        segmentLabel.text = "请选择分类"
        segmentLabel.shadowOffset = CGSizeMake(0, 1)
        segmentLabel.shadowColor = UIColor.whiteColor()
        segmentLabel.textColor = MG_RGB(82, g: 113, b: 131)
        segmentLabel.textAlignment = .Center
        self.view.addSubview(segmentLabel)
        
        
        setUpSegmentControl()
        
        initDropArray()
    }
    
    /**
    init Array
    */
    func initDropArray()
    {
        
        self.literatureArray1 = [
            ["title":"小说"],
            ["title":"漫画"],
            ["title":"青春文学"],
            ["title":"随笔"],
            ["title":"现当代诗"],
            ["title":"戏剧"],
        ];
        self.literatureArray2 = [
            ["title":"传记"],
            ["title":"古诗词"],
            ["title":"外国诗歌"],
            ["title":"艺术"],
            ["title":"摄影"],
        ];
        self.humanitiesArray1 = [
            ["title":"历史"],
            ["title":"文化"],
            ["title":"古籍"],
            ["title":"心理学"],
            ["title":"哲学/宗教"],
            ["title":"政治/军事"],
        ];
        self.humanitiesArray2 = [
            ["title":"社会科学"],
            ["title":"法律"],
        ];
        self.livelihoodArray1 = [
            ["title":"休闲/爱好"],
            ["title":"孕产/胎教"],
            ["title":"烹饪/美食"],
            ["title":"时尚/美妆"],
            ["title":"旅游/地图"],
            ["title":"家庭/家居"],
        ];
        self.livelihoodArray2 = [
            ["title":"亲子/家教"],
            ["title":"两性关系"],
            ["title":"育儿/早教"],
            ["title":"保健/养生"],
            ["title":"体育/运动"],
            ["title":"手工/DIY"],
        ];
        self.economiesArray1  = [
            ["title":"管理"],
            ["title":"投资"],
            ["title":"理财"],
            ["title":"经济"],
        ];
        self.economiesArray2  = [
            ["title":"没有更多了"],
        ];
        self.technologyArray1 =  [
            ["title":"科普读物"],
            ["title":"建筑"],
            ["title":"医学"],
            ["title":"计算机/网络"],
        ];
        self.technologyArray2 = [
            ["title":"农业/林业"],
            ["title":"自然科学"],
            ["title":"工业技术"],
        ];
        self.NetworkArray1 =    [
            ["title":"玄幻/奇幻"],
            ["title":"武侠/仙侠"],
            ["title":"都市/职业"],
            ["title":"历史/军事"],
        ];
        self.NetworkArray2 =    [
            ["title":"游戏/竞技"],
            ["title":"科幻/灵异"],
            ["title":"言情"],
        ];
    }

    
    // MARK:- 设置分类
    func setUpSegmentControl(){
        let buttonArray1 = [
            ["image":"ledger","title":"文学","font":MG_FONT],
            ["image":"drama masks","title":"人文社科","font":MG_FONT],
            ["image":"aperture","title":"生活","font":MG_FONT],
        ]
        segmentControl1 = AKSegmentedControl(frame: CGRectMake(20, 50, MGScreen_Width-40, 40))
        segmentControl1?.initButtonWithTitleandImage(buttonArray1)
        self.view.addSubview(segmentControl1!)
        
        
        let buttonArray2 = [
            ["image":"atom","title":"经管","font":MG_FONT],
            ["image":"alien","title":"科技","font":MG_FONT],
            ["image":"fire element","title":"网络流行","font":MG_FONT],
        ]
        segmentControl2 = AKSegmentedControl(frame: CGRectMake(20, 100, MGScreen_Width-40, 40))
        segmentControl2?.initButtonWithTitleandImage(buttonArray2)
        view.addSubview(segmentControl2!)
        self.segmentControl1?.addTarget(self, action: Selector("segmentControllerAction:"), forControlEvents: .ValueChanged)
        self.segmentControl2?.addTarget(self, action: Selector("segmentControllerAction:"), forControlEvents: .ValueChanged)
        
        }
        /**
        *  segment的点击动作
        */
        func segmentControllerAction(segment:AKSegmentedControl){
            var index = segment.selectedIndexes.firstIndex
            
            self.type = ((segment.buttonsArray[index] as? UIButton)?.currentTitle)!
            
            if segment == self.segmentControl2{
                self.segmentControl2?.setSelectedIndex(3)
            }else{
                self.segmentControl1?.setSelectedIndex(3)
                index += 3
            }
            
            if self.dropDownMenu1 != nil {
                self.dropDownMenu1?.resetParams()
            }
            if self.dropDownMenu2 != nil {
                self.dropDownMenu2?.resetParams()
            }
            
            switch (index){
            case 0:
                createDropMenu(self.literatureArray1, array2: self.literatureArray2)
                break
            case 1:
                createDropMenu(self.humanitiesArray1, array2: self.humanitiesArray2)
                break
            case 2:
                createDropMenu(self.livelihoodArray1, array2: self.livelihoodArray2)
                break
            case 3:
                createDropMenu(self.economiesArray1, array2: self.economiesArray2)
                break
            case 4:
                createDropMenu(self.technologyArray1, array2: self.technologyArray2)
                break
            case 5:
                createDropMenu(self.NetworkArray1, array2: self.NetworkArray2)
                break
            default:
                break
            }
            
        }
        
        /**
        *  初始化dropDownMenu
        */
        func createDropMenu(array1:Array<NSDictionary>,array2:Array<NSDictionary>){
            let dropDownItem1 = NSMutableArray()
            for var i = 0;i<array1.count;i++ {
                let dict = array1[i]
                let item = IGLDropDownItem()
                item.text = dict["title"] as? String
                dropDownItem1.addObject(item)
            }
            
            let dropDownItem2 = NSMutableArray()
            for var i = 0;i<array2.count;i++ {
                let dict = array2[i]
                let item = IGLDropDownItem()
                item.text = dict["title"] as? String
                dropDownItem2.addObject(item)
            }
            
            self.dropDownMenu1?.removeFromSuperview()
            self.dropDownMenu1 = IGLDropDownMenu()
            self.dropDownMenu1?.menuText = "点我，展开详细列表"
            self.dropDownMenu1?.menuButton.textLabel.adjustsFontSizeToFitWidth = true
            self.dropDownMenu1?.menuButton.textLabel.textColor = MG_RGB(38, g: 82, b: 67)
            self.dropDownMenu1?.paddingLeft = 15
            self.dropDownMenu1?.delegate = self
            self.dropDownMenu1?.type = .Stack
            self.dropDownMenu1?.itemAnimationDelay = 0.1
            self.dropDownMenu1?.gutterY = 5
            self.dropDownMenu1?.dropDownItems = dropDownItem1 as [AnyObject]
            self.dropDownMenu1?.frame = CGRectMake(20, 150, MGScreen_Width/2-30, (MGScreen_Height-200)/7)
            self.view.addSubview(self.dropDownMenu1!)
            self.dropDownMenu1?.reloadView()
            
            self.dropDownMenu2?.removeFromSuperview()
            self.dropDownMenu2 = IGLDropDownMenu()
            self.dropDownMenu2?.menuText = "点我，展开详细列表"
            self.dropDownMenu2?.menuButton.textLabel.adjustsFontSizeToFitWidth = true
            self.dropDownMenu2?.menuButton.textLabel.textColor = MG_RGB(38, g: 82, b: 67)
            self.dropDownMenu2?.paddingLeft = 15
            self.dropDownMenu2?.delegate = self
            self.dropDownMenu2?.type = .Stack
            self.dropDownMenu2?.itemAnimationDelay = 0.1
            self.dropDownMenu2?.gutterY = 5
            self.dropDownMenu2?.dropDownItems = dropDownItem2 as [AnyObject]
            self.dropDownMenu2?.frame = CGRectMake(MGScreen_Width/2+10, 150, MGScreen_Width/2-30, (MGScreen_Height-200)/7)
            self.view.addSubview(self.dropDownMenu2!)
            self.dropDownMenu2?.reloadView()
//            setdropDownMenu(self.dropDownMenu1,frame: CGRectMake(20, 150, MGScreen_Width/2-30, (MGScreen_Height-200)/7), dropDownItems: dropDownItem1)
//            setdropDownMenu(self.dropDownMenu2,frame: CGRectMake(MGScreen_Width/2+10, 150, MGScreen_Width/2-30, (MGScreen_Height-200)/7), dropDownItems: dropDownItem2)
    }
    
//    func setdropDownMenu(var dropDownMenu2:IGLDropDownMenu?,frame:CGRect,dropDownItems: NSMutableArray){
//        dropDownMenu2?.removeFromSuperview()
//        dropDownMenu2 = IGLDropDownMenu()
//        dropDownMenu2?.menuText = "点我，展开详细列表"
//        dropDownMenu2?.menuButton.textLabel.adjustsFontSizeToFitWidth = true
//        dropDownMenu2?.menuButton.textLabel.textColor = MG_RGB(38, g: 82, b: 67)
//        dropDownMenu2?.paddingLeft = 15
//        dropDownMenu2?.delegate = self
//        dropDownMenu2?.type = .Stack
//        dropDownMenu2?.itemAnimationDelay = 0.1
//        dropDownMenu2?.gutterY = 5
//        dropDownMenu2?.dropDownItems = dropDownItems as [AnyObject]
//        dropDownMenu2?.frame = CGRectMake(MGScreen_Width/2+10, 150, MGScreen_Width/2-30, (MGScreen_Height-200)/7)
//        self.view.addSubview(dropDownMenu2!)
//        self.dropDownMenu2?.reloadView()
//
//    }
    
    
    /**
    *  IGLDropDownMenuDelegate
    */
    func dropDownMenu(dropDownMenu: IGLDropDownMenu!, selectedItemAtIndex index: Int) {
        if dropDownMenu == self.dropDownMenu1 {
            let item = self.dropDownMenu1?.dropDownItems[index] as? IGLDropDownItem
            self.detailType = (item?.text)!
            self.dropDownMenu2?.menuButton.text = self.detailType
        }else{
            let item = self.dropDownMenu2?.dropDownItems[index] as? IGLDropDownItem
            self.detailType = (item?.text)!
            self.dropDownMenu1?.menuButton.text = self.detailType
        }
    }
        

    // MARK:- 按钮监听操作
    func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func sure(){
        self.callBack!(type:self.type,detailType: self.detailType)
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
}


