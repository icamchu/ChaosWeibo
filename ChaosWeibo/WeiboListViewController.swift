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
    }
//        [WBHttpRequest requestForFollowersListOfUser:myDelegate.wbCurrentUserID withAccessToken:myDelegate.wbtoken andOtherProperties:nil queue:nil withCompletionHandler:^(WBHttpRequest *httpRequest, id result, NSError *error) {
//            
//            DemoRequestHanlder(httpRequest, result, error);
//            
//            }];
//        let documentsFolder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
//        let path = documentsFolder.stringByAppendingPathComponent("test.sqlite")
//        
//        let database = FMDatabase(path: path)
     
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        self.tableView.registerClass(WeiboCell.self, forCellReuseIdentifier: kWeiboCell)
//        WBHttpRequest.init(forActiveFollowersListOfUser: wbCurrentUserID, withAccessToken: wbtoken, andOtherProperties:nil, queue: nil withCompletionHandler:{ (httpRequest:WBHttpRequest!, result:AnyObject!, error:NSError!) -> Void in
//                DemoRequestHanlder(httpReuquest, result:result, error: error)
//            }
//        )
        
        
        WBHttpRequest(forActiveFollowersListOfUser: wbCurrentUserID, withAccessToken: wbtoken, andOtherProperties: nil, queue: nil,
            withCompletionHandler:{ (httpRequest:WBHttpRequest!, result:AnyObject!, error:NSError?) -> Void in
                print(result)
                let resultDict:NSDictionary = result as! NSDictionary
                let resultArray:NSArray = resultDict.objectForKey("users") as! NSArray
                print(resultArray.count)
                self.DemoRequestHanlder(httpRequest, result:result, error:error)
            }
            //
            //            }
 )
        
    }
    
    override  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:WeiboCell = (self.tableView.dequeueReusableCellWithIdentifier(kWeiboCell)) as! WeiboCell
        cell.textLabel!.text = String(format: "%d",  indexPath.row)
        return cell
    }
    
    func DemoRequestHanlder(httpRequest:WBHttpRequest, result:AnyObject, error:NSError?){

//        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
        let alert = UIAlertController(title: "Alert", message: result as? String, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }


 

    
}