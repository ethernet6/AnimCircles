//
//  progressBar.swift
//  circles
//
//  Created by user128353 on 5/22/17.
//  Copyright © 2017 user128353. All rights reserved.
//

import UIKit

class progressBar: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var progress: Double = 50.0{
        didSet{}
    }
    
    
    override func draw(_ rect:CGRect){
    
        let path = UIBezierPath()
        path.lineWidth = 5.0
        let borderX = 10.0
        UIColor.lightGray.setStroke()
        let left = CGPoint(x:CGFloat(0+borderX),y:CGFloat(Double(rect.height/2.0)))
        let right = CGPoint(x:Double(rect.width)-borderX, y:Double(rect.height/2.0))
        path.move(to: left)
        path.addLine(to: right)
        path.stroke()
        
        
        let path1 = UIBezierPath()
        path1.lineWidth = 5.0
        UIColor.cyan.setStroke()
        let right1 = CGPoint(x:(Double(rect.width)-borderX)/100.0*progress,y:Double(rect.height/2.0))
        path1.move(to:left)
        path1.addLine(to: right1)
        path1.stroke()
        
    }

}
