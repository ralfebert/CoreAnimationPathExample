//
//  ViewController.swift
//  CoreAnimationPathExample
//
//  Created by Ralf Ebert on 20.08.18.
//  Copyright © 2018 Ralf Ebert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let layer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: 120, y: 60))
        bezierPath.addLine(to: CGPoint(x: 120, y: 60))
        bezierPath.addLine(to: CGPoint(x: 0, y: 120))
        bezierPath.addLine(to: CGPoint(x: 0, y: 0))

        layer.path = bezierPath.cgPath
        layer.frame = CGRect(x: 50, y: 50, width: 100, height: 100)

        self.view.layer.addSublayer(layer)

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onTap)))

    }

    @objc func onTap() {

        let bezierPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 120, height: 120))

        let animation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
        animation.duration = 0.1
        animation.fromValue = layer.path
        animation.toValue = bezierPath.cgPath
        layer.add(animation, forKey: "LayerPath")

        layer.path = bezierPath.cgPath

    }


}

