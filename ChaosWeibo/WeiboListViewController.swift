//
//  WeiboListViewController.swift
//  ChaosWeibo
//
//  Created by Cam on 28/8/15.
//  Copyright © 2015 Cam. All rights reserved.
//

import Foundation


let kWeiboCell:String = "WeiboCell"
class WeiboListViewController:UITableViewController,WBHttpRequestDelegate{
    var weiboArray:NSMutableArray? = NSMutableArray()
    
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
//        WBHttpRequest(forActiveFollowersListOfUser: wbCurrentUserID, withAccessToken: wbtoken, andOtherProperties: nil, queue: nil,
//            withCompletionHandler:{ (httpRequest:WBHttpRequest!, result:AnyObject!, error:NSError?) -> Void in
//                print(result)
//                let resultDict:NSDictionary = result as! NSDictionary
//                let resultArray:NSArray = resultDict.objectForKey("users") as! NSArray
//                print(resultArray.count)
//                self.DemoRequestHanlder(httpRequest, result:result, error:error)
//            }
//        )
        self.tableView.registerClass(WeiboCell.self, forCellReuseIdentifier: kWeiboCell)
        WBHttpRequest.init(accessToken: wbtoken, url: "https://api.weibo.com/2/statuses/friends_timeline.json", httpMethod: "Get", params: nil, delegate: self, withTag: nil)
    }
    
    override  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (weiboArray?.count)!
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:WeiboCell = (self.tableView.dequeueReusableCellWithIdentifier(kWeiboCell)) as! WeiboCell
        
        let originalWeibo:OriginalWeibo?  = weiboArray?.objectAtIndex(indexPath.row) as! OriginalWeibo
        cell.textLabel!.text = String(format: "%@",  originalWeibo!.text!)
        
        if let url = NSURL(string:(originalWeibo?.profileImageURL)! ) {
            if let data = NSData(contentsOfURL: url){
                cell.imageView!.contentMode = UIViewContentMode.ScaleAspectFit
                cell.imageView!.image = UIImage(data:data)
            }
        }
        return cell
    }
    
    func request(request: WBHttpRequest!, didFinishLoadingWithDataResult data: NSData!) {
    
        do{
            let resultDict:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers) as! NSDictionary;
            let resultArray:NSArray = resultDict.objectForKey("statuses") as! NSArray
            for (index,element) in resultArray.enumerate(){
                let weiboDict = element as! NSDictionary
                let weiboEntity:OriginalWeibo = OriginalWeibo()
                weiboEntity.createdTime = weiboDict["create_at"] as? String
                weiboEntity.text = weiboDict["text"] as? String
                weiboArray?.addObject(weiboEntity)
                
                weiboEntity.profileImageURL = (weiboDict["user"] as! NSDictionary)["profile_image_url"] as! String
            }
            self.tableView.reloadData()
        }
        catch{
            
        }

    }
    
    func request(request: WBHttpRequest!, didFailWithError error: NSError!) {
        print(error)
    }
    func DemoRequestHanlder(httpRequest:WBHttpRequest, result:AnyObject, error:NSError?){

//        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.Alert)
        let alert = UIAlertController(title: "Alert", message: result as? String, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }


 

    
}