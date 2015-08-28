//
//  WeiboListViewController.swift
//  ChaosWeibo
//
//  Created by Cam on 28/8/15.
//  Copyright © 2015 Cam. All rights reserved.
//

import Foundation
let kWeiboCell:String = "WeiboCell"
class WeiboListViewController:UITableViewController{
    override init(style: UITableViewStyle){
        super.init(style: style)
        [WBHttpRequest requestForFollowersListOfUser:myDelegate.wbCurrentUserID withAccessToken:myDelegate.wbtoken andOtherProperties:nil queue:nil withCompletionHandler:^(WBHttpRequest *httpRequest, id result, NSError *error) {
            
            DemoRequestHanlder(httpRequest, result, error);
            
            }];
        WBHttpRequest.req
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        self.tableView.registerClass(WeiboCell.self, forCellReuseIdentifier: kWeiboCell)
    }
    override  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:WeiboCell = (self.tableView.dequeueReusableCellWithIdentifier(kWeiboCell)) as! WeiboCell
        cell.textLabel!.text = String(format: "%d",  indexPath.row)
        return cell
    }

 

    
}