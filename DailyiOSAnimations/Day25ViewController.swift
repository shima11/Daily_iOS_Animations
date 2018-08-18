//
//  Day25ViewController.swift
//  DailyiOSAnimations
//
//  Created by jinsei shima on 2018/08/18.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day25ViewController: UIViewController {
    
    let redView: UIView = .init()
    let blueView: UIView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueView)
        
        redView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        redView.center = view.center
        
        
    }
    
    
}
