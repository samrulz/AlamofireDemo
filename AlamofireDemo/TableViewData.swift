//
//  TableViewData.swift
//  AlamofireDemo
//
//  Created by Embin on 27/12/18.
//  Copyright © 2018 Embin. All rights reserved.
//

import Foundation
import UIKit

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerView") as! HeaderView
        headerCell.lblHeaderName.text = dataArray[section].name!
        headerCell.lblCityName.text = dataArray[section].city!
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70.0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].details!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserDataList
        cell.lblName.text = dataArray[indexPath.section].details![indexPath.row].organization!
        cell.lblCity.text = dataArray[indexPath.section].details![indexPath.row].position!
        
        
       // cell.lblDetails.text = dataArray[indexPath.row].details![indexPath.row].organization!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}

class UserDataList: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblDetails2: UILabel!
    
}

class HeaderView: UITableViewCell {
    @IBOutlet weak var lblHeaderName: UILabel!
    @IBOutlet weak var lblCityName: UILabel!
    
}
