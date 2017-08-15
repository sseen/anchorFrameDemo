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
        button.setTitle("hello", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(ck(_:)), for: .touchUpInside)
        
        let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        button2.backgroundColor = UIColor.purple
        button2.center = self.view.center
        button2.setTitle("hello", for: .normal)
        button2.setTitleColor(UIColor.white, for: .normal)
        
        self.view.addSubview(button2)
        self.view.addSubview(button)
        
        let view0 = UIView(frame: CGRect.zero)
        view0.frame.size = CGSize(width: 40, height: 40)
        view0.position(CGPoint(x:100,y:20), anchorPoint: CGPoint.zero)
        view0.backgroundColor = UIColor.brown
        
        self.view.addSubview(view0)
    }
    
    
    func ck(_ bt:UIButton) {
        self.rotateView(bt, byRadianDegrees: CGFloat(Double.pi / 2), withAnchorPoint: CGPoint(x: 1, y: 1))
        
    }
    
    func rotateView(_ view:UIView, byRadianDegrees radianDegrees:CGFloat, withAnchorPoint relativeAnchorPoint:CGPoint) {
        UIView.beginAnimations(nil, context: nil)
        let viewBounds = view.bounds
        var anchorPoint = CGPoint(x: viewBounds.width * relativeAnchorPoint.x, y: viewBounds.height * relativeAnchorPoint.y)
        print("\(view.frame), \(anchorPoint)")
        // view.layer.anchorPoint = CGPoint(x: 1, y: 1)
        print("\(view.frame), \(anchorPoint)")
        anchorPoint = CGPoint(x: viewBounds.width / 2, y: viewBounds.width / 2)
        var transform = CGAffineTransform.identity
        transform = transform.translatedBy(x: anchorPoint.x, y: anchorPoint.y)
        transform = transform.rotated(by: -radianDegrees)
        transform = transform.translatedBy(x: -anchorPoint.x, y: -anchorPoint.y)
        
        view.transform = transform
        UIView.commitAnimations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIView {
    func position(_ postion:CGPoint, anchorPoint:(CGPoint)) {
        let x = postion.x - anchorPoint.x * self.frame.width
        let y = postion.y - anchorPoint.y * self.frame.height
        
        self.frame.origin = CGPoint(x: x, y: y)
    }
}

