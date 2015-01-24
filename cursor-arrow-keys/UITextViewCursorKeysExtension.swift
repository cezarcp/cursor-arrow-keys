//
//  UITextViewCursorKeysExtension.swift
//  cursor-arrow-keys
//
//  Created by Cezar Carvalho Pereira on 24/1/15.
//  Copyright (c) 2015 Wavebits. All rights reserved.
//

import UIKit

extension UITextView {
    
    struct Timer {
        static var timer: NSTimer?
    }
    
    func setupInputAccessoryView() {
        let inputAccessoryView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0),
                                                        size: CGSize(width: UIScreen.mainScreen().bounds.size.width, height: 44.0)))
        inputAccessoryView.backgroundColor = UIColor.lightGrayColor()
        
        let leftArrow = UIButton(frame: CGRect(origin: CGPoint(x: inputAccessoryView.center.x - 40.0 - 8.0, y: 2.0),
                                                 size: CGSize(width: 40.0, height: 40.0)))
        
        leftArrow.setTitle("<", forState: .Normal)
        leftArrow.addTarget(self, action: "leftArrowKeyTapped:", forControlEvents: UIControlEvents.TouchDown)
        leftArrow.addTarget(self, action: "arrowKeyReleased:", forControlEvents: .TouchUpInside)
        leftArrow.addTarget(self, action: "arrowKeyReleased:", forControlEvents: .TouchUpOutside)
        
        let rightArrow = UIButton(frame: CGRect(origin: CGPoint(x: inputAccessoryView.center.x + 8.0, y: 2.0),
                                                  size: CGSize(width: 40.0, height: 40.0)))
        
        rightArrow.setTitle(">", forState: .Normal)
        rightArrow.addTarget(self, action: "rightArrowKeyTapped:", forControlEvents: UIControlEvents.TouchDown)
        rightArrow.addTarget(self, action: "arrowKeyReleased:", forControlEvents: .TouchUpInside)
        rightArrow.addTarget(self, action: "arrowKeyReleased:", forControlEvents: .TouchUpOutside)
  
        
        inputAccessoryView.addSubview(leftArrow)
        inputAccessoryView.addSubview(rightArrow)
        
        self.inputAccessoryView = inputAccessoryView
    }
    
    func leftArrowKeyTapped(sender: UIButton) {
        self.moveCursorLeft()
        Timer.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "moveCursorLeft", userInfo: nil, repeats: true)
    }
    
    func rightArrowKeyTapped(sender: UIButton) {
        self.moveCursorRight()
        Timer.timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "moveCursorRight", userInfo: nil, repeats: true)
    }
    
    func arrowKeyReleased(sender: UIButton) {
        Timer.timer?.invalidate()
        Timer.timer = nil
    }
    
    func moveCursorLeft() {
        self.moveCursorInDirection(.Left)
    }
    
    func moveCursorRight() {
        self.moveCursorInDirection(.Right)
    }
    
    func moveCursorInDirection(direction: UITextLayoutDirection) {
        if let startPosition = self.selectedTextRange?.start {
            let finalPosition = self.positionFromPosition(startPosition, inDirection: direction, offset: 1)
            self.selectedTextRange = self.textRangeFromPosition(finalPosition, toPosition: finalPosition)
        }
    }
}
