//
//  SecondViewController.swift
//  Credit-Me
//
//  Created by Bill Yu on 7/11/16.
//  Copyright © 2016 Bill Yu. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {

    @IBOutlet weak var meetView: UIStackView!
    @IBOutlet weak var deliverView: UIStackView!
    
    var meetType: MeetType = .meet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapOnMeetGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnMeet))
        let tapOnDeliverGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnDeliver))
        meetView.addGestureRecognizer(tapOnMeetGesture)
        deliverView.addGestureRecognizer(tapOnDeliverGesture)
    }
    
    func tapOnMeet() {
        meetType = .meet
        performSegue(withIdentifier: SegueID.PICK_EATERY, sender: self)
    }
    
    func tapOnDeliver() {
        meetType = .deliver
        performSegue(withIdentifier: SegueID.PICK_EATERY, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == SegueID.PICK_EATERY) {
            
        }
    }
}

