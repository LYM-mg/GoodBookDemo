//
//  MGPhotoSelectController.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

protocol MGPhotoSelectControllerDelegate: NSObjectProtocol{
    func selectImage(image: UIImage)
}

class MGPhotoSelectController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var alertVC: UIAlertController?
    var imagePickerVC: UIImagePickerController = UIImagePickerController()
    var delegate: MGPhotoSelectControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
   
   init(){
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .OverFullScreen
        self.view.backgroundColor = UIColor.clearColor()
        imagePickerVC.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if alertVC == nil {
            alertVC =
                UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            alertVC!.addAction(UIAlertAction(title: "从相册中选择", style: .Default, handler: { (action) -> Void in
                self.getImageFormPhoto()
            }))
            
            alertVC!.addAction(UIAlertAction(title: "从相机选择", style: .Default, handler: { (action) -> Void in
                self.getImageFromCamera()
            }))
            
            alertVC!.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: { (action) -> Void in
            }))
            
            presentViewController(alertVC!, animated: true, completion: nil)
        }
        
    }
    
    // 从相册中获取
    private func getImageFormPhoto(){
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary){
            imagePickerVC.sourceType = .PhotoLibrary
            imagePickerVC.allowsEditing = true
            
            presentViewController(imagePickerVC, animated: true, completion: nil)
            return
        }else {
            let alert = UIAlertController(title: "友情提示", message: "相册不可用", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "关闭", style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    // 从相机中获取
    private func getImageFromCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePickerVC.sourceType = .Camera
            imagePickerVC.allowsEditing = true
            presentViewController(imagePickerVC, animated: true, completion: nil)
        }else {
            let alert = UIAlertController(title: "友情提示", message: "此设备没有摄像头", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "关闭", style: .Cancel, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    // 代理方法
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let newImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.delegate?.selectImage(newImage)
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
}
