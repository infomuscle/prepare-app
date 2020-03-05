//
//  ViewController.swift
//  Prepare
//
//  Created by 정보근 on 2020/03/04.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btnPlan: UIButton!
    
    
    var plans = Array<Array<String>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        plans = [["Los Angeles", "bg-001.jpg"], ["Las Vegas", "bg-002.jpg"], ["San Francisco", "bg-003.jpg"]]

        let lblX: CGFloat = 16
        var lblY: CGFloat = 121
        let btnX: CGFloat = 16
        var btnY: CGFloat = 150
        
        if plans.isEmpty {
            let dynamicLbl = UILabel()
            dynamicLbl.textColor = UIColor.lightGray
            dynamicLbl.text = "Make new plan"
            dynamicLbl.frame = CGRect(x: lblX, y: lblY, width: 200, height: 21)
            self.view.addSubview(dynamicLbl)
            
            let dynamicBtn = PlanButton()
            dynamicBtn.borderColor = UIColor.lightGray
            dynamicBtn.borderWidth = 1
            dynamicBtn.cornerRadius = 10
            dynamicBtn.setTitle("+", for: UIControl.State.normal)
            dynamicBtn.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
            dynamicBtn.frame = CGRect(x: btnX, y: btnY, width: 343, height: 161)
            self.view.addSubview(dynamicBtn)
        } else {
            
            for i in 0..<plans.count {
                // Label
                let dynamicLbl = UILabel()
                dynamicLbl.text = plans[i][0]
                dynamicLbl.textColor = UIColor.lightGray
                dynamicLbl.frame = CGRect(x: lblX, y: lblY, width: 200, height: 21)
                self.view.addSubview(dynamicLbl)
                
                // Buttion
                let dynamicBtn = PlanButton()
                dynamicBtn.borderColor = UIColor.lightGray
                dynamicBtn.borderWidth = 1
                dynamicBtn.cornerRadius = 10
                dynamicBtn.clipsToBounds = true
                let bgImg: UIImage? = UIImage(named: plans[i][1])
                dynamicBtn.setBackgroundImage(bgImg, for: UIControl.State.normal)
                dynamicBtn.frame = CGRect(x: btnX, y: btnY, width: 343, height: 161)
                self.view.addSubview(dynamicBtn)
                
                lblY += 210
                btnY += 210
            }
        }
    }

}

