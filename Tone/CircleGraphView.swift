//
//  CircleGraphView.swift
//  Tone
//
//  Created by Christopher Aziz on 7/9/17.
//  Copyright © 2017 Christopher Aziz. All rights reserved.
//


import UIKit

class CircleGraphView: UIView {
    var endArc:CGFloat = 0.0{   // in range of 0.0 to 1.0
        didSet{
            setNeedsDisplay()
        }
    }
    var arcWidth:CGFloat = 10.0
    var arcColor = UIColor.yellow
    var arcBackgroundColor = UIColor.white
    
    override func draw(_ rect: CGRect) {
        
        //Important constants for circle
        let fullCircle = 2.0 * CGFloat(Double.pi)
        let start:CGFloat = -0.25 * fullCircle
        let end:CGFloat = endArc * fullCircle + start
        
        //find the centerpoint of the rect
        let centerPoint = CGPoint(x: rect.midX, y: rect.midY)
        
        //define the radius by the smallest side of the view
        var radius:CGFloat = 0.0
        
        if rect.width > rect.height{
            radius = (rect.width - arcWidth) / 2.0
        }else{
            radius = (rect.height - arcWidth) / 2.0
        }
        
        //starting point for all drawing code is getting the context.
        let context = UIGraphicsGetCurrentContext()
        
        //set colorspace
        let colorspace = CGColorSpaceCreateDeviceRGB()
        
        //set line attributes
        context?.setLineWidth(arcWidth)
        context?.setLineCap(.round)
        
        //make the circle background
        context?.setStrokeColor(arcBackgroundColor.cgColor)
        //        let center = CGPoint(x: view.height/2, y: view.width/2)
        //        let radius = (round(frame.size.width) - 10)/(2 * (appDelegate.webview?.scrollView.zoomScale)!)
        
        
        //        CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, 0, fullCircle, 0)
        context?.addArc(center: centerPoint, radius: radius, startAngle: 0, endAngle: fullCircle, clockwise: false)
        
        context?.strokePath()
        
        //draw the arc
        context?.setStrokeColor(arcColor.cgColor)
        context?.setLineWidth(arcWidth * 0.8 )
        
        //CGContextSetLineWidth(context, arcWidth)
        //        CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, start, end, 0)
        context?.addArc(center: centerPoint, radius: radius, startAngle: start, endAngle: end, clockwise: false)
        context?.strokePath()
        
    }
}
