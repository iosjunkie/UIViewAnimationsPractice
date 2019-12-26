//
//  ViewController.swift
//  UIViewAnimationsPractice
//
//  Created by Jules Lee on 12/26/19.
//  Copyright © 2019 Jules Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var block: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(blockTapped))
        block.addGestureRecognizer(tap)
        block.isUserInteractionEnabled = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.up()
        }
    }
    
    @objc func blockTapped() {
        UIView.animate(withDuration: 1.2) {
            let sizeMultiplier = CGFloat(1.5) // 1.5 times bigger than it was bigger
            let currentBlockFrame = self.block.frame
            let newSize = currentBlockFrame.width * sizeMultiplier
            let newX = currentBlockFrame.origin.x - (newSize - currentBlockFrame.width) / 2
            let newY = currentBlockFrame.origin.y - (newSize - currentBlockFrame.height) / 2
            self.block.frame = CGRect(x: newX, y: newY, width: newSize, height: newSize)
        }
    }
    
    func up() {
        UIView.animate(withDuration: 1, animations: {
            self.block.frame.origin = CGPoint(x: self.view.center.x - (self.block.frame.width / 2), y: 0)
        }) { (success) in
            self.right()
        }
    }
    
    func right() {
        UIView.animate(withDuration: 1, animations: {
            self.block.frame.origin = CGPoint(x: self.view.frame.width - self.block.frame.width, y: self.view.center.y - (self.block.frame.size.height / 2))
        }) { (success) in
            self.down()
        }
    }
    
    func left() {
        UIView.animate(withDuration: 1, animations: {
            self.block.frame.origin = CGPoint(x: 0, y: self.view.center.y - (self.block.frame.size.height / 2))
        }) { (success) in
            self.reset()
        }
    }
    
    func down() {
        UIView.animate(withDuration: 1, animations: {
            self.block.frame.origin = CGPoint(x: self.view.center.x - (self.block.frame.width / 2), y: self.view.frame.height - self.block.frame.height)
        }) { (success) in
            self.left()
        }
    }
    
    func reset() {
        UIView.animate(withDuration: 1) {
            self.block.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        }
    }

}

