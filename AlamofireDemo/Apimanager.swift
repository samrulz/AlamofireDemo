//
//  Apimanager.swift
//  AlamofireDemo
//
//  Created by Embin on 26/12/18.
//  Copyright © 2018 Embin. All rights reserved.
//

import Foundation
import UIKit
import Alamofire


class Connectivity {
    class var isConnectedToInternet:Bool{
        return (NetworkReachabilityManager()?.isReachable)!
    }
}

public func requestGetUrl(url:String,params:[String:Any]?,headers:HTTPHeaders?,success:@escaping(Data?)->Void,failure:@escaping(Error)->Void){
    
    guard Connectivity.isConnectedToInternet else {
        return
    }
    
   
    
    Alamofire.request(url, method:.get, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) in
        //print(responseObject)
        guard let status = responseObject.response?.statusCode else{return}
        
        switch(status){
        case 200:
            print("example success")
        default:
            print("error with response status: \(status)")
        }
        
        switch responseObject.result{
        case .success(_):
            guard let data = responseObject.data  else{return}
            
            let jsonDic = data
            success(jsonDic)
            break
            
        case .failure(_):
            let error = responseObject.result.error!
            failure(error)
            break
        }
    }

}

public func requestPostUrl(url:String,params:[String:Any],headers:HTTPHeaders,success:@escaping([String:Any])->Void,failure:@escaping(Error)->Void){
    guard Connectivity.isConnectedToInternet else {
        print("failed")
        return
    }
    Alamofire.request(url, method:.post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { (responseObject) in
        //print(responseObject)
        
        guard let status = responseObject.response?.statusCode else{return}
        
        switch(status){
        case 200:
            print("example success")
        default:
            print("error with response status: \(status)")
        }
        
        switch responseObject.result{
        case .success(_):
            guard let data = responseObject.result.value  else{return}
            
            let jsonDic = data as! [String:Any]
            success(jsonDic)
            break
            
        case .failure(_):
            let error = responseObject.result.error!
            failure(error)
            break
        }
        
    }

    
}
