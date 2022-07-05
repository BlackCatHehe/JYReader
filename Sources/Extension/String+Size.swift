//
//  String+Size.swift
//  JYReader_Example
//
//  Created by black on 2022/7/5.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
extension String {
    func split(rect: CGRect) -> [String] {
        
        let attrString = NSAttributedString(string: self)
        
        var strArray:[String] = []
        
        let framesetter = CTFramesetterCreateWithAttributedString(attrString as CFAttributedString)
        
        let path = CGPath(rect: rect, transform: nil)
        
        var range = CFRangeMake(0, 0)
        
        var rangeOffset:NSInteger = 0
        
        repeat{
            
            let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(rangeOffset, 0), path, nil)
            
            range = CTFrameGetVisibleStringRange(frame)
            
            let curRange = NSMakeRange(rangeOffset, range.length)
            
            strArray.append((attrString.string as NSString).substring(with: curRange))
            
            rangeOffset += range.length
            
        }while(range.location + range.length < attrString.length)
        
        return strArray
    }
}
