//
//  ViewController.swift
//  five-day-swift mjRefresh
//
//  Created by MacBook Pro on 2019/4/11.
//  Copyright © 2019年 MacBookPro. All rights reserved.
//

import UIKit
import SnapKit
//MARK:自己想着写的 
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let cell_identifier:String = "zidingyicell"
    var myTableView = UITableView()
    //刷新数据
    var refreshcontrol = UIRefreshControl()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath))
        cell.textLabel?.text = "1234"
       // cell.textLabel?.text = dataSuorceArray[indexPath.row]
        return cell
        
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.yellow
      
  
        
        self.myTableView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.plain)
        self.myTableView.tableFooterView = UIView.init()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.view.addSubview(self.myTableView)
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        
        //添加刷新
        
        refreshcontrol.addTarget(self, action: #selector(ViewController.refreshData), for: .valueChanged)
        
        refreshcontrol.attributedTitle = NSAttributedString(string: "下拉刷新")
        self.myTableView.addSubview(refreshcontrol)
      refreshData()
        
      
        let testButton = UIButton.init(type: UIButton.ButtonType.custom)
        testButton.frame = .init(x: 100, y: 100, width: 100, height: 100)
        
        testButton.backgroundColor = UIColor.yellow
        testButton.addTarget(self, action: #selector(testButtonClick), for: .touchUpInside)
      self.view.addSubview(testButton)
    }
   
    @objc func testButtonClick(){
        //print("点击按钮")
        let pushVc = secondViewController.init()
       self.present(pushVc, animated: false, completion: nil)
        
    }
    @objc func refreshData(){
        self.myTableView.reloadData()
        self.refreshcontrol.endRefreshing()
    }
    
         
  

}

