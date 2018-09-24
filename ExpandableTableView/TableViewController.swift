//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by Sandeep Palod on 20/09/18.
//  Copyright © 2018 Sandeep Palod. All rights reserved.
//

import UIKit

struct cellData {
    var opend = Bool()
    var title = String()
    var sectionData = [String]()
    var sectionImage = String()
}

class TableViewController: UITableViewController {

    var tableViewData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SectionData is for expandablecell data
        
        self.tableView.rowHeight = 70
        
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableViewData = [cellData(opend: false, title: "Booking", sectionData: ["1","2","3"],sectionImage :"booking"),
        cellData(opend: false, title: "Reviews", sectionData: ["Given Reviews","Booked Vehicles"],sectionImage :"review"),
        cellData(opend: false, title: "Vehicals", sectionData: ["A","B"],sectionImage :"Vehicles"),
        cellData(opend: false, title: "Settings", sectionData: ["X","Y","X"],sectionImage :"settings"),
        cellData(opend: false, title: "Help", sectionData: [],sectionImage :"help"),
        cellData(opend: false, title: "Logout", sectionData: [],sectionImage :"logout")]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableViewData[section].opend == true {
            return tableViewData[section].sectionData.count + 1
        }else{
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
              let title = tableViewData[indexPath.section].title
              let imageName = tableViewData[indexPath.section].sectionImage
            cell.titleLabel.text = title
            cell.titleLabel.textColor = UIColor.black
            cell.titleLabel.textAlignment = .natural
            cell.imgView.image = UIImage(named: imageName)
 
            return cell
        }else{
            let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
              cell.titleLabel.text = tableViewData[indexPath.section].sectionData[dataIndex]
              cell.titleLabel.textColor = UIColor.black
              cell.titleLabel.textAlignment = .center
              cell.imgView.image = UIImage(named: "") // Here we can pass image Array
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            if tableViewData[indexPath.section].opend == true{
                tableViewData[indexPath.section].opend = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }else{
                tableViewData[indexPath.section].opend = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
                
                if indexPath.section == 0{
                    print("title 1")
                }else if indexPath.section == 1{
                    print("title 2")
                }
                
            }
        }
    }
    
}

