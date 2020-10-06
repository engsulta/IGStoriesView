//
//  IGRoundedView.swift
//  IGStoriesView
//
//  Created by Ahmed Sultan on 10/6/20.
//  Copyright © 2020 hamza. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class IGRoundedView: UIView {

    @IBInspectable var borderWidth: CGFloat = 0
    @IBInspectable var imageBorderShift: CGFloat = 0
    @IBInspectable var borderColor: UIColor = .clear
    @IBInspectable var gradeintStartColor: UIColor = .clear
    @IBInspectable var gradeintEndColor: UIColor = .clear
    @IBInspectable var image: UIImage? = nil {
        didSet {
            imageView.image = image
        }
    }
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.borderWidth = borderWidth
        iv.layer.borderColor = borderColor.cgColor
        iv.clipsToBounds = true
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        backgroundColor = .clear
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        clipsToBounds = true
        backgroundColor = .clear
        addSubview(imageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
        gradient.colors = [gradeintStartColor.cgColor, gradeintEndColor.cgColor]

        let shape = CAShapeLayer()
        shape.lineWidth = borderWidth

        shape.path = UIBezierPath(roundedRect: self.bounds.insetBy(dx: borderWidth/2, dy: borderWidth/2), byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: frame.height/2, height: frame.height/2)).cgPath

        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        self.layer.addSublayer(gradient)
        imageView.frame = CGRect(x:borderWidth + imageBorderShift,
                                 y:borderWidth + imageBorderShift,
                                 width:(frame.size.width)-((borderWidth + imageBorderShift) * 2),
                                 height:frame.size.height-((borderWidth + imageBorderShift) * 2))
        imageView.layer.cornerRadius = imageView.frame.height/2

    }
}

extension IGRoundedView {
    func enableBorder(enabled: Bool = true) {
        if enabled {
            layer.borderColor = UIColor.clear.cgColor
            layer.borderWidth = 0
        }else {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
        }
    }
}
