//
//  ZDMetroLabel.swift
//  ZDMetroLabel
//
//  Created by Nicole De La Feld on 09/03/2015.
//  Copyright (c) 2015 ZD. All rights reserved.
//

import UIKit
import Foundation

enum ZDSpinDirection {
    case UP
    case DOWN
    case LEFT
    case RIGHT
}

class ZDMetroLabel: UILabel {
    var direction: ZDSpinDirection = .DOWN
    var oldLabelInitialFrame, newLabelInitialFrame, oldLabelFinalFrame, newLabelFinalFrame: CGRect!
    
    override func awakeFromNib() {
        setFrames(.DOWN)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setFrames(.DOWN)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setFrames(.DOWN)
    }
    
    func setFrames(aDirection: ZDSpinDirection) {
        switch aDirection {
            case .DOWN:
                oldLabelInitialFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                oldLabelFinalFrame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: self.frame.height)
                newLabelInitialFrame = CGRect(x: 0, y: -self.frame.height, width: self.frame.width, height: self.frame.height)
                newLabelFinalFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
            case .UP:
                oldLabelInitialFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                oldLabelFinalFrame = CGRect(x: 0, y: -self.frame.height, width: self.frame.width, height: self.frame.height)
                newLabelInitialFrame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: self.frame.height)
                newLabelFinalFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
            case .RIGHT:
                oldLabelInitialFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                oldLabelFinalFrame = CGRect(x: self.frame.size.width, y: 0, width: self.frame.width, height: self.frame.height)
                newLabelInitialFrame = CGRect(x: -self.frame.size.width, y: 0, width: self.frame.width, height: self.frame.height)
                newLabelFinalFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
            case .LEFT:
                oldLabelInitialFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                oldLabelFinalFrame = CGRect(x: -self.frame.size.width, y: 0, width: self.frame.width, height: self.frame.height)
                newLabelInitialFrame = CGRect(x: +self.frame.size.width, y: 0, width: self.frame.width, height: self.frame.height)
                newLabelFinalFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        }
    }
    
    // override property setter
    override var text: String? {
        willSet {
            setFrames(self.direction)
            let oldText = createLabel(oldLabelInitialFrame)
            oldText.text = self.text
            addSubview(oldText)
            let newText = createLabel(newLabelInitialFrame)
            newText.text = newValue
            addSubview(newText)
            super.text = ""
            super.textColor = UIColor.clearColor()
            // cannot call super.text inside closure
            var auxText = super.text
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                oldText.frame = self.oldLabelFinalFrame
                newText.frame = self.newLabelFinalFrame
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
        
        label.layer.borderWidth = self.layer.borderWidth
        label.layer.borderColor = self.layer.borderColor
        label.layer.cornerRadius = self.layer.cornerRadius
        
        return label
    }
}
