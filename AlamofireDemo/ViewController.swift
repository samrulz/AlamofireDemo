//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Embin on 26/12/18.
//  Copyright © 2018 Embin. All rights reserved.
//

import UIKit
import Alamofire
import AFNetworking



class ViewController: UIViewController {
    
    var dataArray = [DataArray]()
    var detailsArray = [DetailsArray]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy"
        let myStringafd = formatter.string(from: yourDate!)
        print(myStringafd)
        
        let qtyString = "\(Int("6")!) " + "Grams".localized + " (1 Portion)"
        print(qtyString)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120.0
        //tableView.register(HeaderView.self, forCellReuseIdentifier: "headerView")
        tableView.register(UINib(nibName: "HeaderView", bundle: nil), forCellReuseIdentifier: "headerView")
        let headers:HTTPHeaders = [
            "Content-Type": "application/json",
            "X-API-KEY":"connecteddevice!123"
        ]

       // let urlString =  "http://admin.myicuisine.com/ws/recipe/favoriteunfavorite"
        let urlString = "https://api.myjson.com/bins/z4q7k"
        let parameters = ["iUserID" : "196" ,
                          "iRecipeID" : "380" ,
                          "eFlag" : "eFlag",
                          "X-API-KEY" : "connecteddevice!123"] as [String:Any]
        requestGetUrl(url: urlString, params: nil, headers: nil, success: { (data) in
            do{
              let decoder = JSONDecoder()
                let list = try decoder.decode(DataList.self, from: data!)
                let listSecond = list.data!
                self.dataArray = listSecond

               print(self.dataArray)
  
                self.tableView.reloadData()

            }catch{
                
            }
            
            
        }) { (error) in
            print(error)
        }
//        requestPostUrl(url: urlString, params: parameters, headers: headers, success: { (data) in
//            print(data)
//        }) { (error) in
//            print(error)
//        }
        
    }
    
}

struct DataList:Codable {
    let data:[DataArray]?
}
struct DataArray:Codable {
    let city:String?
    let details:[DetailsArray]?
    let name:String?
}
struct DetailsArray:Codable {
    let organization:String?
    let position:String?
}


extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
