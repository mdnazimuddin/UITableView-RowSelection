//
//  SlideViewController.swift
//  RowSelection
//
//  Created by Nazim Uddin on 17/8/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {

    @IBOutlet weak var leadingSlideView: NSLayoutConstraint!
    var isHiddin:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        leadingSlideView.constant = -140

        // Do any additional setup after loading the view.
    }
    @IBAction func slideChangeAction(_ sender: UIBarButtonItem) {
        if(isHiddin)
        {
            UIView.animate(withDuration: 1) {
                self.leadingSlideView.constant = 0
                self.view.layoutIfNeeded()
            }
        }else{
            UIView.animate(withDuration: 1) {
                self.leadingSlideView.constant = -140
                self.view.layoutIfNeeded()
            }
        }
        isHiddin = !isHiddin
    }
    

  

}
