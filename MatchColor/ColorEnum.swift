//
//  ColorEnum.swift
//  MatchColor
//
//  Created by user04 on 2018/10/3.
//  Copyright © 2018年 jerryHU. All rights reserved.
//

import UIKit

class ColorEnum: NSObject {
    
    enum easyColor:Int {
        case redColor
        case blueColor
        case greenColor
        case grayColor
        case yellowColor
        case orangeColor
        case blackColor
        case purpleColor
        case brownColor
        
        func uicolor() -> UIColor{
            switch self {
            case .redColor:
                return UIColor.red
            case .blueColor:
                return UIColor.blue
            case .greenColor:
                return UIColor.green
            case .grayColor:
                return UIColor.gray
            case .yellowColor:
                return UIColor.yellow
            case .orangeColor:
                return UIColor.orange
            case .blackColor:
                return UIColor.black
            case .purpleColor:
                return UIColor.purple
            case .brownColor:
                return UIColor.brown
            }
        }
    }
    
    enum midColor:Int {
        case red1Color
        case red2Color
        case red3Color
        case red4Color
        case green1Color
        case green2Color
        case green3Color
        case green4Color
        case blue1Color
        case blue2Color
        case blue3Color
        case blue4Color
        
        func uicolor() -> UIColor{
            switch self {
            case .red1Color:
                //39%
                return UIColor(red:0.76, green:0.20, blue:0.01, alpha:1.0)
            case .red2Color:
                //45%
                return UIColor(red:0.96, green:0.25, blue:0.02, alpha:1.0)
            case .red3Color:
                //59%
                return UIColor(red:0.98, green:0.39, blue:0.19, alpha:1.0)
            case .red4Color:
                //69%
                return UIColor(red:0.99, green:0.54, blue:0.39, alpha:1.0)
            
                
            case .green1Color:
                //27%
                return UIColor(red:0.04, green:0.44, blue:0.09, alpha:1.0)
            case .green2Color:
                //40%
                return UIColor(red:0.07, green:0.74, blue:0.15, alpha:1.0)
            case .green3Color:
                //54%
                return UIColor(red:0.15, green:0.93, blue:0.25, alpha:1.0)
            case .green4Color:
                //70%
                return UIColor(red:0.45, green:0.95, blue:0.52, alpha:1.0)
            
                
            case .blue1Color:
                //45%
                return UIColor(red:0.21, green:0.49, blue:0.69, alpha:1.0)
            case .blue2Color:
                //61%
                return UIColor(red:0.41, green:0.65, blue:0.82, alpha:1.0)
            case .blue3Color:
                //78%
                return UIColor(red:0.66, green:0.80, blue:0.90, alpha:1.0)
            case .blue4Color:
                //91%
                return UIColor(red:0.87, green:0.92, blue:0.96, alpha:1.0)
            }
        }
    }
    
    enum diffColor:Int {
        case red1Color
        case red2Color
        case red3Color
        case red4Color
        case red5Color
        case green1Color
        case green2Color
        case green3Color
        case green4Color
        case green5Color
        case blue1Color
        case blue2Color
        case blue3Color
        case blue4Color
        case blue5Color
        
        func uicolor() -> UIColor{
            switch self {
                //e66253
            case .red1Color:
                //48%
                return UIColor(red:0.84, green:0.20, blue:0.12, alpha:1.0)
            case .red2Color:
                //55%
                return UIColor(red:0.89, green:0.28, blue:0.21, alpha:1.0)
            case .red3Color:
                //61%
                return UIColor(red:0.90, green:0.38, blue:0.33, alpha:1.0)
            case .red4Color:
                //68%
                return UIColor(red:0.92, green:0.49, blue:0.44, alpha:1.0)
            case .red5Color:
                //75%
                return UIColor(red:0.94, green:0.60, blue:0.56, alpha:1.0)
                
                
                //1cc840
            case .green1Color:
                //38%
                return UIColor(red:0.09, green:0.67, blue:0.21, alpha:1.0)
            case .green2Color:
                //45%
                return UIColor(red:0.11, green:0.78, blue:0.25, alpha:1.0)
            case .green3Color:
                //51%
                return UIColor(red:0.15, green:0.88, blue:0.30, alpha:1.0)
            case .green4Color:
                //58%
                return UIColor(red:0.26, green:0.90, blue:0.40, alpha:1.0)
            case .green5Color:
                //65%
                return UIColor(red:0.38, green:0.91, blue:0.49, alpha:1.0)
                
                
                //0482af
            case .blue1Color:
                //48%
                return UIColor(red:0.02, green:0.70, blue:0.95, alpha:1.0)
            case .blue2Color:
                //55%
                return UIColor(red:0.12, green:0.75, blue:0.98, alpha:1.0)
            case .blue3Color:
                //62%
                return UIColor(red:0.25, green:0.79, blue:0.98, alpha:1.0)
            case .blue4Color:
                //68%
                return UIColor(red:0.38, green:0.83, blue:0.98, alpha:1.0)
            case .blue5Color:
                //75%
                return UIColor(red:0.51, green:0.86, blue:0.99, alpha:1.0)
            }
        }
    }
    
}
