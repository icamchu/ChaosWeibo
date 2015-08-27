//
//  ViewController.swift
//  ChaosWeibo
//
//  Created by Cam on 26/8/15.
//  Copyright © 2015 Cam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func loginButtonPressed(sender: AnyObject) {
        let request:WBAuthorizeRequest = WBAuthorizeRequest.request() as! WBAuthorizeRequest
        request.redirectURI = kRedirectURL
        request.scope = "all"
        request.userInfo = ["SSO_From":"ViewController",
            "Other_Info_1": 123,
            "Other_Info_2": ["obj1", "obj2"],
            "Other_Info_3": ["key1": "obj1", "key2": "obj2"]
        ]
        WeiboSDK.sendRequest(request);
        wbtoken = ""
    }
}

