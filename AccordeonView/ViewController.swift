//
//  ViewController.swift
//  AccordeonView
//
//  Created by Kirill Netavskiy on 19.04.17.
//  Copyright © 2017 Kirill Netavskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewOne: UIView!
    @IBOutlet var viewTwo: UIView!
    @IBOutlet var viewThree: UIView!
    
    @IBOutlet var viewOneWidth: NSLayoutConstraint!
    @IBOutlet var viewTwoWidth: NSLayoutConstraint!
    @IBOutlet var viewThreeWidth: NSLayoutConstraint!
    
    let width = UIScreen.main.bounds.width
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapGestures()
        setImage(view: viewThree, image: #imageLiteral(resourceName: "Unknown-3"))
    }
    
    func setTapGestures() {
        let tapOne = UITapGestureRecognizer(target: self, action: #selector(tapOnViewOne))
        viewOne.addGestureRecognizer(tapOne)
        let tapTwo = UITapGestureRecognizer(target: self, action: #selector(tapOnViewTwo))
        viewTwo.addGestureRecognizer(tapTwo)
        let tapTree = UITapGestureRecognizer(target: self, action: #selector(tapOnViewTree))
        viewThree.addGestureRecognizer(tapTree)
    }
    
    func tapOnViewOne() {
        setWidthAndPutImage(view: viewOne, width: viewOneWidth, image: #imageLiteral(resourceName: "Unknown-1"))
    }
    
    func tapOnViewTwo() {
        setWidthAndPutImage(view: viewTwo, width: viewTwoWidth, image: #imageLiteral(resourceName: "Unknown-2"))
    }
    
    func tapOnViewTree() {
        setWidthAndPutImage(view: viewThree, width: viewThreeWidth, image: #imageLiteral(resourceName: "Unknown-3"))
    }
    
    func setWidthAndPutImage(view: UIView, width: NSLayoutConstraint, image: UIImage) {
        imageView.removeFromSuperview()
        UIView.animate(withDuration: 0.5) {
            self.changeWidth(width: width)
            self.setImage(view: view, image: image)
        }
        
    }
    
    func changeWidth(width: NSLayoutConstraint) {
        switch width {
        case viewOneWidth:
            viewOneWidth.constant = self.width - 100
            viewTwoWidth.constant = 50
            viewThreeWidth.constant = 50
        case viewTwoWidth:
            viewOneWidth.constant = 50
            viewTwoWidth.constant = self.width - 100
            viewThreeWidth.constant = 50
        case viewThreeWidth:
            viewOneWidth.constant = 50
            viewTwoWidth.constant = 50
            viewThreeWidth.constant = self.width - 100
        default:
            print("No such width")
        }
        view.layoutIfNeeded()
    }
    
    func setImage(view: UIView, image: UIImage) {
        let pointX = (self.width - 100)/2 - image.size.width/2
        let pointY = view.bounds.height/2 - image.size.height/2
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: pointX, y: pointY, width: image.size.width, height: image.size.height)
        view.addSubview(imageView)
    }
}

