//
//  config.swift
//  GoodBookDemo
//
//  Created by ming on 16/5/6.
//  Copyright © 2016年 ming. All rights reserved.
//

import UIKit

/** 屏幕的宽度 */
let MGScreen_Width = UIScreen.mainScreen().bounds.width
/** 屏幕的高度 */
let MGScreen_Height = UIScreen.mainScreen().bounds.height

/** 颜色 */
let MAIN_Color = UIColor(red: 233/255, green: 144/255, blue: 118/255, alpha: 1)

/** 字体 */
let MG_FONT = "Bauhaus ITC"

func MG_RGB(r:CGFloat , g: CGFloat, b:CGFloat) -> UIColor {
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

let MGNotificationCenter = NSNotificationCenter.defaultCenter()