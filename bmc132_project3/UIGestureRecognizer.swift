//
//  UIGestureRecognizer.swift
//  bmc132_project3
//
//
//

import Foundation
import UIKit

extension UIGestureRecognizer {
    
    convenience init(trailingClosure closure: @escaping (() -> ())) {
        
        // let UIGestureRecognizer do its thing
        self.init()
        
        // create a new target
        Target.target.append(Target(closure))
        guard let lastTarget = Target.target.last else {
            print("Error: Unable go get target for class Target")
            return
        }
        
        // connect the target to the gesture
        self.addTarget(lastTarget, action: #selector(Target.invoke))
    }
}

private class Target {
    
    // collection of targets
    static var target = [Target]()
    
    // store closure
    private var trailingClosure: (() -> ())
    
    init(_ closure:@escaping (() -> ())) {
        trailingClosure = closure
    }
    
    // function that gesture calls, which then calls closure
    @IBAction func invoke() {
        trailingClosure()
    }
}
