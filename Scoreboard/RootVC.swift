//
//  RootVC.swift
//  Scoreboard
//
//  Created by Irwin Gonzales on 7/1/18.
//  Copyright © 2018 Irwin Gonzales. All rights reserved.
//

import UIKit

class RootVC: UIViewController
{
    @IBOutlet var tableView: UITableView?

//    fileprivate struct C {
//        struct CellHeight {
//            static let close: CGFloat = 179 // equal or greater foregroundView height
//            static let open: CGFloat = 488 // equal or greater containerView height
//            static var workout = [Score]()
//        }
//    }
//    var cellHeights = (0..<C.CellHeight.workoutCount.count).map { _ in C.CellHeight.close }
    
    enum Const {
        static let closeCellHeight: CGFloat = 179
        static let openCellHeight: CGFloat = 488
        static let rowsCount = 10
    }
    
    var cellHeights: [CGFloat] = []
    
    var cell = ScoreTableViewCell()
    var cellId = "cell"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView?.register(UINib.init(nibName: "ScoreTableViewCell", bundle: .main), forCellReuseIdentifier: cellId)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        setup()
        
    }
    
    private func setup() {
        cellHeights = Array(repeating: Const.closeCellHeight, count: Const.rowsCount)
        self.tableView?.estimatedRowHeight = Const.closeCellHeight
        self.tableView?.rowHeight = UITableViewAutomaticDimension
        if #available(iOS 10.0, *) {
            self.tableView?.refreshControl = UIRefreshControl()
            self.tableView?.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        }
    }
    
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.tableView?.refreshControl?.endRefreshing()
            }
            self?.tableView?.reloadData()
        })
    }
}

extension RootVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    
}



