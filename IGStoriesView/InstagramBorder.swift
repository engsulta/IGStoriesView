//
//  InstagramBorder.swift
//  IGStoriesView
//
//  Created by Ahmed Sultan on 10/6/20.
//  Copyright © 2020 hamza. All rights reserved.
//
#if canImport(UIKit)
import UIKit

class InstagramBorder: UIView {

    override func draw(_ rect: CGRect) {
        let linewidth: CGFloat = 5
        let colors : [UIColor] = self.graint()
        for i in 0..<colors.count-1 {
            let graint = CAGradientLayer()
            graint.bounds = CGRect(origin:CGPoint.zero, size: CGSize(width:bounds.width/2,height:bounds.height/2))
            let valuePoint = self.positionArrayWith(bounds: self.bounds)[i]
            graint.position = valuePoint
            print("iesimo graint position: \(graint.position)")
            let fromColor = colors[i]
            let toColor = colors[i+1]
            let colors : [CGColor] = [fromColor.cgColor,toColor.cgColor]
            let stopOne: CGFloat = 0.0
            let stopTwo: CGFloat = 1.0
            let locations : [CGFloat] = [stopOne,stopTwo]
            graint.colors = colors
            graint.locations = locations as [NSNumber]?
            graint.startPoint = self.startPoints()[i]
            graint.endPoint = self.endPoints()[i]
            self.layer.addSublayer(graint)
//            //Set mask
            let shapelayer = CAShapeLayer()
            let rect = CGRect(origin:CGPoint.zero,size:CGSize(width:self.bounds.width - 2 * linewidth,height: self.bounds.height - 2 * linewidth))
            shapelayer.bounds = rect
            shapelayer.position = CGPoint(x:self.bounds.width/2,y: self.bounds.height/2)
            shapelayer.strokeColor = UIColor.blue.cgColor
            shapelayer.fillColor = UIColor.clear.cgColor
            shapelayer.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.width/2).cgPath
            shapelayer.lineWidth = linewidth
            shapelayer.lineCap = CAShapeLayerLineCap.round
            shapelayer.strokeStart = 0
            let finalValue:CGFloat = 1
            shapelayer.strokeEnd = finalValue//0.99;
            self.layer.mask = shapelayer
        }
    }

    func graint() -> [UIColor]{
        let first = UIColor(red:0.553, green:0.157, blue:0.561, alpha: 1.000)
        let second = UIColor(red:0.839, green:0.333, blue:0.239, alpha: 1.000)
        let third = UIColor(red:0.922, green:0.627, blue:0.325, alpha: 1.000)
        let fourth = UIColor(red:0.733, green:0.180, blue:0.408, alpha: 1.000)
        return [first ,second, third, fourth, first]
    }

    func positionArrayWith(bounds:CGRect) -> [CGPoint]{
        let first = CGPoint(x:(bounds.width/4)*3,y: (bounds.height/4)*1)
        let second = CGPoint(x:(bounds.width/4)*3,y: (bounds.height/4)*3)
        let third = CGPoint(x:(bounds.width/4)*1,y: (bounds.height/4)*3)
        let fourth = CGPoint(x:(bounds.width/4)*1,y: (bounds.height/4)*1)
        print([first,second,third,fourth])
        return [first,second,third,fourth]
    }

    func startPoints() -> [CGPoint] {
        return [CGPoint.zero,CGPoint(x:1,y:0),CGPoint(x:1,y:1),CGPoint(x:0,y:1)]
    }

    func endPoints() -> [CGPoint] {
        return [CGPoint(x:1,y:1),CGPoint(x:0,y:1),CGPoint.zero,CGPoint(x:1,y:0)]
    }
}
#endif
