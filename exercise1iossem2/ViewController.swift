//
//  ViewController.swift
//  exercise1iossem2
//
//  Created by Simran Chakkal on 2020-01-08.
//  Copyright © 2020 Simran Chakkal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let swiperight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swiperight.direction = UISwipeGestureRecognizer.Direction.right
        view.addGestureRecognizer(swiperight)
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeleft.direction = UISwipeGestureRecognizer.Direction.left
        view.addGestureRecognizer(swipeleft)
        
        UIView.animate(withDuration: 10, delay: 0.1, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.1, options: [.repeat,.autoreverse], animations: {
             self.imageview.center = CGPoint(x: self.imageview.center.x, y: self.imageview.center.y + 580)
        }, completion: nil)
        
// for autoreverse
//        UIView.animate(withDuration: 5, delay: 0.1, options: [.repeat,.autoreverse], animations: {
//            self.imageview.center = CGPoint(x: self.imageview.center.x, y: self.imageview.center.y + 840)
//            //self.imageview.center.y += 150
//
//           // self.imageview.center.y += self.view.bounds.height
//        }, completion: nil)
    
        // Do any additional setup after loading the view.
    }



    
//    override func viewWillAppear(_ animated: Bool) {
//        imageview.center.x -= view.bounds.height
//
//    }
//
    
//    override func viewWillAppear() {
//            super.viewWillAppear()
//            preferredContentSize = NSSize(width: 400, height: 280)
//    }
    
    @objc func swiped(gesture:UISwipeGestureRecognizer){
        let swipegesture = gesture as UISwipeGestureRecognizer
       
        
        
    
        switch swipegesture.direction{
        
        case UISwipeGestureRecognizer.Direction.right:
            
            self.imageview.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            
            UIView.animate(withDuration: 2, delay: 0.1, options: [.curveLinear], animations: {
                self.imageview.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 25 , width: 25, height: 25)
            }) { (completefirst) in
                UIView.animate(withDuration: 2, delay: 0.1, options: [.curveLinear], animations: {
                    self.imageview.frame = CGRect(x: UIScreen.main.bounds.width - 25, y: UIScreen.main.bounds.height - 25, width: 25, height: 25)
                }) { (completesecond) in
                    UIView.animate(withDuration: 2, delay: 0.1, options: [.curveLinear], animations: {
                        self.imageview.frame = CGRect(x: UIScreen.main.bounds.width - 25, y: 0, width:  25, height: 25)
                    }) { (completethird) in
                        UIView.animate(withDuration: 2, delay: 0.1, options: [.curveLinear], animations: {
                            self.imageview.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
                        })
                    }
                }
            }
//
            print("swipe right")
            
        case UISwipeGestureRecognizer.Direction.left:
            self.imageview.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
                       UIView.animate(withDuration: 2, delay: 0.1, options: [.curveLinear], animations: {
                           self.imageview.frame = CGRect(x: UIScreen.main.bounds.width - 25, y: 0 , width: 25, height: 25)
                       }) { (completefirst) in
                           UIView.animate(withDuration: 2, delay: 0.1, options: [.curveLinear], animations: {
                               self.imageview.frame = CGRect(x: UIScreen.main.bounds.width - 25, y: UIScreen.main.bounds.height - 25, width: 25, height: 25)
                           }) { (completesecond) in
                               UIView.animate(withDuration: 2, delay: 0.1, options: [.curveLinear], animations: {
                                   self.imageview.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 25, width:  25, height: 25)
                               }) { (completethird) in
                                   UIView.animate(withDuration: 2, delay: 0.1, options: [.curveLinear], animations: {
                                       self.imageview.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
                                   })
                               }
                           }
                       }
            
             print("swipe left")
            
        default:
            break;
        }
    }

}

