//
//  SecondTableData.swift
//  AlamofireDemo
//
//  Created by Embin on 28/12/18.
//  Copyright © 2018 Embin. All rights reserved.
//

import Foundation
import UIKit

extension SecondViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  movieDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! DataListCell
        cell.lblDataName.text = movieDataArray[indexPath.row].show!.title!
        cell.lblDataDescription.text = movieDataArray[indexPath.row].show!.overview!
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == movieDataArray.count - 1{
           limit = limit + 20
            self.dataTableView.reloadData()
          
        }
    }
    
    
    
    
}

class DataListCell: UITableViewCell {
    
    @IBOutlet weak var lblDataName: UILabel!
    @IBOutlet weak var lblDataDescription: UILabel!
}
