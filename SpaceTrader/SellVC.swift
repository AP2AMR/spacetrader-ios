//
//  SellVC.swift
//  SpaceTrader
//
//  Created by Marc Auger on 9/22/15.
//  Copyright © 2015 Marc Auger. All rights reserved.
//

import UIKit

class SellVC: UIViewController {
    
    @IBAction func CreateAlert(sender: AnyObject) {
        var alert = UIAlertController(title: "Escaped", message: "You have successfully escaped your opponent.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func CreateCustom(sender: AnyObject) {
        let custom = MyCustomView()
        custom.addCustomView()
    }
    
    
}

class MyCustomView: UIView {
    var label: UILabel = UILabel()
    var myNames = ["dipen","laxu","anis","aakash","santosh","raaa","ggdds","house"]
    
//    override init(){
//        super.init()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCustomView() {
        label.frame = CGRectMake(50, 10, 200, 100)
        label.backgroundColor=UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.text = "test label"
        label.hidden=true
        self.addSubview(label)
        
        var btn: UIButton = UIButton()
        btn.frame=CGRectMake(50, 120, 200, 100)
        btn.backgroundColor=UIColor.redColor()
        btn.setTitle("button", forState: UIControlState.Normal)
        btn.addTarget(self, action: "changeLabel", forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(btn)
        
        var txtField : UITextField = UITextField()
        txtField.frame = CGRectMake(50, 250, 100,50)
        txtField.backgroundColor = UIColor.grayColor()
        self.addSubview(txtField)
    }
}