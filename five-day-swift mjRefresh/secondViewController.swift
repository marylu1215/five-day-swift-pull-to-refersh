//
//  secondViewController.swift
//  five-day-swift mjRefresh
//
//  Created by MacBook Pro on 2019/4/14.
//  Copyright © 2019年 MacBookPro. All rights reserved.
//

import UIKit
//MARK:看着别的项目照般过来的 
class secondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var dataSource = Array<Date>()
    let refresh = UIRefreshControl()
    var table : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        
        table = UITableView(frame: self.view.bounds)
        table.frame.origin.y = 44
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
         addNewElementToArray()
        
        refresh.attributedTitle = NSAttributedString(string: "拉什么拉！？再拉朕就要碎了")
        
        refresh.addTarget(self, action: #selector(pullTheRefresh), for: UIControl.Event.valueChanged)
        table.addSubview(refresh)
         table.reloadData()
    }
    
    @objc func pullTheRefresh() {
        addNewElementToArray()
        refresh.endRefreshing()
        table.reloadData()
    }
    func addNewElementToArray() {
        dataSource.insert(NSDate() as Date, at: 0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseCellForPullToRefresh")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dateStr = dateFormatter.string(from: dataSource[indexPath.row])
        cell.textLabel?.text = dateStr
        return cell
    }
   
}
