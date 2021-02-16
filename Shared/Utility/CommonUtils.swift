//
//  CommonUtils.swift
//  HypedList
//
//  Created by Sanjay Sampat on 16/02/21.
//

import Foundation
import SwiftUI

struct CommonUtils {
    
    //MARK: - Color
    static func uicolorFromHexString( theHexString: String) -> UIColor? {   // eg. "#RRGGBBAA"
        var returnColor:UIColor? = nil
        if !theHexString.isEmpty {
            var hexColorString = theHexString
            if theHexString.hasPrefix("#") {
                let start = theHexString.index(theHexString.startIndex, offsetBy: 1)
                hexColorString = String(theHexString[start...])
            }
            var hexNumber:UInt64 = 0
            var r,g,b,a: CGFloat
            if hexColorString.count == 6 {
                // If string does not have Alpha component then add "FF" opaque for it.
                hexColorString.append("FF")
            }
            if hexColorString.count == 8 {
                let scanner = Scanner(string: hexColorString)
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat((hexNumber & 0x000000ff)) / 255
                    returnColor = UIColor(red: r, green: g, blue: b, alpha: a)
                }
            }
        }
        return returnColor
    }
    
    static func HexStringFromUicolor( theUicolor: UIColor ) -> String {
        var returnString = ""
        if let colorRef = theUicolor.cgColor.components {
            var r, g, b, a : CGFloat
            r = colorRef[0]
            g = colorRef[1]
            b = colorRef[2]
            a = colorRef[3]
            returnString = String(format: "#%02lX%02lX%02lX%02lX", lroundf(Float(r*255)),  lroundf(Float(g*255)), lroundf(Float(b*255)), lroundf(Float(a*255)) )
        }
        return returnString
    }
    
}
