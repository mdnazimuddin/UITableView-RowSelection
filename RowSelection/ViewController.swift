//
//  ViewController.swift
//  RowSelection
//
//  Created by Nazim Uddin on 7/8/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var selectedIcon: UIImageView!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var addItemViewTop: NSLayoutConstraint!
    
    @IBOutlet weak var itemView: UIView!
    
    var data = [String]()
    var selectedData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        addItemViewTop.constant  = -150
        itemView.layer.cornerRadius = 10
        
        self.tblView.isEditing = true
        self.tblView.allowsMultipleSelectionDuringEditing = true
    }
    func getData(){
        data = ["Hello 1","Hello 2","Hello 3","Hello 4","Hello 5","Hello 6","Hello 7","Hello 8","Hello 9","Hello 10"]
    }
    @IBAction func nextActivity(_ sender: UIButton) {
        let selectedItems:SelectedItemsViewController = self.storyboard?.instantiateViewController(withIdentifier: "SelectedItemsViewController") as! SelectedItemsViewController
        selectedItems.arraData = selectedData
        selectedItems.title = "Selected Items"
        self.navigationController?.pushViewController(selectedItems, animated: true)
    }
    @IBAction func multipleSelection(_ sender: UIButton) {
        selectedData.removeAll()
        if sender.isSelected {
            for row in 0..<data.count {
                self.tblView.selectRow(at: IndexPath(row: row, section: 0), animated: true, scrollPosition: .none)
            }
            selectedData = data
            sender.isSelected = false
            sender.setImage(UIImage(named: "selected.png"), for: .normal)
        }else{
            for row in 0..<data.count {
                self.tblView.deselectRow(at: IndexPath(row: row, section: 0), animated: true)
            }
            selectedData.removeAll()
            sender.isSelected = true
            sender.setImage(UIImage(named: "nonselected.png"), for: .normal)
        }
    }
    
    @IBAction func showAddItemView(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.addItemViewTop.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func addItem(_ sender: Any) {
        if !txtField.text!.isEmpty {
            data.append(txtField.text!)
            let indexPath = IndexPath(row: data.count-1, section: 0)
            tblView.beginUpdates()
            tblView.insertRows(at: [indexPath], with: .automatic)
            tblView.endUpdates()
        }
        
        txtField.text = ""
    }
    
    @IBAction func closeAddItemView(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.addItemViewTop.constant = -150
            self.view.layoutIfNeeded()
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectDeselect(tableView: tableView, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         selectDeselect(tableView: tableView, indexPath: indexPath)
    }
    
}
extension ViewController{
    func selectDeselect(tableView:UITableView,indexPath:IndexPath){
        selectedData.removeAll()
        if let arr = tableView.indexPathsForSelectedRows {
            for index in arr {
                selectedData.append(data[index.row])
            }
        }
    }
}
