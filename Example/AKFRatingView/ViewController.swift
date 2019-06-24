//
//  ViewController.swift
//  AKFRatingView
//
//  Created by akfdmrzn on 06/24/2019.
//  Copyright (c) 2019 akfdmrzn. All rights reserved.
//

import UIKit
import AKFRatingView

class ViewController: UIViewController,AKFRateViewDelegate {
    func didChangedRateView(sender: AKFRatingView) {
        
    }
    

    @IBOutlet weak var viewAKF: AKFRatingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setViews()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setViews(){
        let a = User.init(id: "s", s: 2)
        
        print(self.viewAKF.currentValue)
    }

}

