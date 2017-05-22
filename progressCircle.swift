//
//  progressCircle.swift
//  circles
//
//  Created by user128353 on 5/22/17.
//  Copyright © 2017 user128353. All rights reserved.
//

import UIKit

class progressCircle: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var daysLeft:String?{
        didSet{}
    }

    override func draw(_ rect:CGRect)
    {
        let sizeOfSpaceWidth = bounds.size.width
        let sizeOfSpaceHeight = bounds.size.height
        
        let halfSize:CGFloat = min( sizeOfSpaceWidth/2, sizeOfSpaceHeight/2)
        
        let desiredLineWidth:CGFloat = 1
        
        let path = UIBezierPath(
            arcCenter: CGPoint(x:halfSize, y:halfSize),
            radius: CGFloat( halfSize*0.75 - (desiredLineWidth/2)),
            startAngle: CGFloat(270.01 * M_PI/180),
            endAngle:CGFloat(Double.pi * 0.45),
            clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        
        shapeLayer.lineWidth = desiredLineWidth
        
        layer.addSublayer(shapeLayer)
        
        let progressLine = CAShapeLayer()
        progressLine.path = path.cgPath
        progressLine.strokeColor = UIColor.blue.cgColor
        progressLine.fillColor = UIColor.clear.cgColor
        progressLine.lineWidth = 10.0
        progressLine.lineCap = kCALineCapRound
        
        layer.addSublayer(progressLine)
        
        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = 3.0
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        
        // add the animation
        progressLine.add(animateStrokeEnd, forKey: "animate stroke end animation")
        
        
        //let anim = CAKeyframeAnimation(keyPath: "position")
        //anim.path = path.cgPath
        //anim.duration = 5.0
        
        //layer.add(anim, forKey: "animate position along path")
        
        if(daysLeft == nil){
            let size = sizeOfSpaceWidth/2.0
            let label = UILabel(frame:CGRect(x:halfSize-(size/2.0),y:halfSize-(size/2.0),width:size,height:size))
            label.text = "ABL" + " left!"
            label.textAlignment = .center
            self.addSubview(label)
        }
    }
    
}
