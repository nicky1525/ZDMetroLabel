//
//  ZDMetroLabel.swift
//  ZDMetroLabel
//
//  Created by Nicole De La Feld on 09/03/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

import UIKit

class ZDMetroLabel: UILabel {
    
    // override property setter
    override var text: String? {
        willSet {
            let oldText = createLabel(CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
            oldText.text = self.text
            addSubview(oldText)
            let newText = createLabel(CGRect(x: 0, y: -frame.size.height, width: frame.size.width, height: frame.size.height))
            newText.text = newValue
            addSubview(newText)
            super.text = ""
            super.textColor = UIColor.clearColor()
            // cannot call super.text inside closure
            var auxText = super.text
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                newText.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                oldText.frame = CGRect(x: 0, y: +self.frame.height, width: self.frame.width, height: self.frame.height)
            }) { (Bool) -> Void in
                newText.removeFromSuperview()
                oldText.removeFromSuperview()
                auxText = newValue
                self.textColor = newText.textColor
            }
        }
    }
    
    // create a label with the same style of self
    func createLabel(frame:CGRect) -> UILabel {
        var label = UILabel(frame: frame)
        label.textColor = self.textColor
        label.font = self.font
        label.textAlignment = self.textAlignment
        if (self.backgroundColor != nil) {
            label.backgroundColor = self.backgroundColor
        }
        return label
    }
}
