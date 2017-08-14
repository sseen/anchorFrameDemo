//
//  ViewController.swift
//  anchorFrameDemo
//
//  Created by sseen on 2017/8/14.
//  Copyright © 2017年 sseen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        button.backgroundColor = UIColor.purple
        button.center = self.view.center
        button.addTarget(self, action: #selector(ck(_:)), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    func ck(_ bt:UIButton) {
        self.rotateView(bt, byRadianDegrees: CGFloat(Double.pi / 2), withAnchorPoint: CGPoint(x: 0.5, y: 0.0))
        
    }
    
    func rotateView(_ view:UIView, byRadianDegrees radianDegrees:CGFloat, withAnchorPoint relativeAnchorPoint:CGPoint) {
        let viewBounds = view.bounds
        let anchorPoint = CGPoint(x: viewBounds.width * relativeAnchorPoint.x, y: viewBounds.height * relativeAnchorPoint.y)
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: anchorPoint.x, y: anchorPoint.y)
        transform = transform.rotated(by: radianDegrees)
        transform = transform.translatedBy(x: -anchorPoint.x, y: -anchorPoint.y)
        
        view.transform = transform
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

