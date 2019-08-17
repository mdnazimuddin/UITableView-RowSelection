//
//  SelectedItemsViewController.swift
//  RowSelection
//
//  Created by Nazim Uddin on 17/8/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class SelectedItemsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tblView: UITableView!
    var arraData:[String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = arraData[indexPath.row]
        return cell
    }


}
