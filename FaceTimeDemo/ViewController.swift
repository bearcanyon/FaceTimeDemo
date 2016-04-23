//
//  ViewController.swift
//  FaceTimeDemo
//
//  Created by KumagaiNaoki on 2016/04/21.
//  Copyright © 2016年 KumagaiNaoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backImage = "fujisan.jpg"
    let face1 = "abe.jpg"
    let face1Address = "facetime-audio://j.a.r.n0405@gmail.com"
    let face2 = "obama.jpg"
    
    let backImageView = UIImageView()
    let maskView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.grayColor()
        makeBackgroundImage()
        makeBackgroundMaskView()
        makeImageView(y: self.view.frame.height * 1 / 3, tag: 1, image: face1)
//        makeImageView(y: self.view.frame.height * 2 / 3, tag: 2, image: face2)
    }
    
    func makeBackgroundImage() {
        backImageView.frame = self.view.frame
        backImageView.center = self.view.center
        backImageView.image = UIImage(named: backImage)
        self.view.addSubview(backImageView)
    }
    
    func makeBackgroundMaskView() {
        maskView.frame = self.view.frame
        maskView.center = self.view.center
        maskView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        backImageView.addSubview(maskView)
    }
    
    func makeImageView(y y:CGFloat, tag:Int, image:String) {
        let imageView = UIImageView()
        imageView.frame.size = CGSizeMake(150, 150)
        imageView.center = CGPointMake(self.maskView.center.x,y)
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor(white: 1, alpha: 0.8).CGColor
        imageView.image = UIImage(named: image)
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.userInteractionEnabled = true
        imageView.tag = tag
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapImage(_:)))
        imageView.addGestureRecognizer(tap)
        maskView.addSubview(imageView)
    }
    
    func tapImage(sender: UITapGestureRecognizer) {
        print("\(#function),\(#line)")
        //UITapGestureRecognizer.superviewでは取れないので調べる
        if let url = NSURL(string: face1Address) {
            UIApplication.sharedApplication().openURL(url)
            
        }
    }
}