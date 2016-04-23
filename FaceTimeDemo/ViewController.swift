//
//  ViewController.swift
//  FaceTimeDemo
//
//  Created by KumagaiNaoki on 2016/04/21.
//  Copyright © 2016年 KumagaiNaoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let backImage = "jinja.jpg"
    
    let name1 = "安倍晋三"
    let face1 = "abe.jpg"
    let face1Address = "facetime://j.a.r.n0405@gmail.com"
    let name2 = "バラク・オバマ"
    let face2 = "obama.jpg"
    let face2Address = "facetime://j.a.r.n0405@gmail.com"
    
    let backImageView = UIImageView()
    let maskView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.grayColor()
        makeBackgroundImage()
        makeBackgroundMaskView()
        makeImageView(y: self.view.frame.height * 1/3, tag: 1, image: face1, name: name1)
        makeImageView(y: self.view.frame.height * 2/3, tag: 2, image: face2, name: name2)
        makeTitleLabel()

    }
    func makeTitleLabel(){
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: 100)
        label.text = "ご用の方はどちらかのアイコンを\nタップしてください"
        label.font = UIFont.boldSystemFontOfSize(20)
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor(white: 1, alpha: 0.8)
        maskView.addSubview(label)
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
        self.view.addSubview(maskView)
    }
    
    func makeImageView(y y:CGFloat, tag:Int, image:String, name:String) {
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
        
        self.view.addSubview(imageView)
        makeNameLabel(imageView, name: name)
    }
    
    func makeNameLabel(image: UIImageView, name:String) {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 100, width: image.frame.width, height: 20)
        label.text = name
        label.font = UIFont.boldSystemFontOfSize(15)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor(white: 1, alpha: 0.8)
        image.addSubview(label)
    }
    
    func tapImage(sender: UITapGestureRecognizer) {
        let tag = sender.view?.tag
        if tag == 1 {
            if let url = NSURL(string: face1Address) {
                UIApplication.sharedApplication().openURL(url)
            }
        } else if tag == 2 {
            if let url = NSURL(string: face2Address) {
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }
    
}