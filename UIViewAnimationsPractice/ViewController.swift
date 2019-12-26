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


}

