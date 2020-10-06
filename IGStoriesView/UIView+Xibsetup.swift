//
//  UIView+Xibsetup.swift
//  IGStoriesView
//
//  Created by Ahmed Sultan on 10/6/20.
//

import UIKit
extension UIView {
    func loadViewFromNib(nibName: String, in bundle: Bundle? = nil) -> UIView? {
        let nib = UINib(nibName: nibName, bundle: bundle ?? Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }

    func xibSetup(contentView: UIView) {
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
}
