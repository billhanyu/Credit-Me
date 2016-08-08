//
//  FirstViewController.swift
//  Credit-Me
//
//  Created by Bill Yu on 7/11/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import UIKit
import Firebase

class MarketViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var slider: UIView!
    @IBOutlet weak var buyersLabel: UILabel!
    @IBOutlet weak var sellersLabel: UILabel!
    
    @IBOutlet weak var buyersTableView: UITableView!
    @IBOutlet weak var sellersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        initUI()
    }
    
    override func viewWillLayoutSubviews() {
        scrollView.contentSize = CGSize(width: 2 * scrollView.frame.size.width, height: scrollView.frame.size.height)
        buyersTableView.removeConstraints(buyersTableView.constraints)
        sellersTableView.removeConstraints(sellersTableView.constraints)
        buyersTableView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        sellersTableView.frame = CGRect(x: scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
    }

    func initUI() {
        let grayColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 1)
        sellersLabel.textColor = grayColor
    }
}

extension MarketViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let proportion = scrollView.contentOffset.x / self.view.bounds.width
        slider.center.x = buyersLabel.center.x + proportion * (sellersLabel.center.x - buyersLabel.center.x)
        if (proportion < 0 || proportion > 1) {
            return
        }
        let sellersColor = UIColor(red: (190 - 190 * proportion) / 255, green: (190 - 190 * proportion) / 255, blue: (190 - 190 * proportion) / 255, alpha: 1)
        let buyersColor = UIColor(red: 190 * proportion / 255, green: 190 * proportion / 255, blue: 190 * proportion / 255, alpha: 1)
        sellersLabel.textColor = sellersColor
        buyersLabel.textColor = buyersColor
    }
}
