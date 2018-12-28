//
//  SecondViewController.swift
//  AlamofireDemo
//
//  Created by Embin on 28/12/18.
//  Copyright © 2018 Embin. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
    
    var movieDataArray = [MovieData]()
    var limit = 20

    @IBOutlet weak var dataTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://api.trakt.tv/shows/trending?extended=full,images&limit=\(limit)&page=1"
        let headers:HTTPHeaders = [
            "Content-Type": "application/json",
            "trakt-api-key":"2e1d97c236b73fdbbdc4edac3fb5f4e22324446beaf306306e3bba61c3bf0412",
            "trakt-api-version":"2"
        ]
        
        requestGetUrl(url: url, params: nil, headers: headers, success: { (data) in
            do{
                let decoder = JSONDecoder()
                let list = try decoder.decode([MovieData].self, from: data!)
                self.movieDataArray = list
                self.dataTableView.reloadData()
                
            }catch{
                
            }

        }) { (error) in
            print(error)
        }

    }

}

struct MovieData:Codable {
    let show:ShowData?
}

struct ShowData:Codable {
    let title:String?
    let overview:String?
}
