//
//  ViewController.swift
//  Prepare
//
//  Created by 정보근 on 2020/03/04.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var navBar: UINavigationBar!
    
    var plans = Array<Array<String>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()

        plans = [["Los Angeles", "bg-001.jpg"], ["Las Vegas", "bg-002.jpg"], ["San Francisco", "bg-003.jpg"], ["San Diegeo", "bg-004.jpg"]]

        let lblX: CGFloat = 16
        var lblY: CGFloat = 15
        let btnX: CGFloat = 16
        var btnY: CGFloat = 40
        
        
        
        
        if plans.isEmpty {
            // Label
            let dynamicLbl = UILabel()
            dynamicLbl.textColor = UIColor.lightGray
            dynamicLbl.text = "Make new plan"
            dynamicLbl.frame = CGRect(x: lblX, y: lblY, width: 200, height: 21)
            self.scrollView.addSubview(dynamicLbl)
            
            // Button
            let dynamicBtn = PlanButton()
            dynamicBtn.borderColor = UIColor.lightGray
            dynamicBtn.borderWidth = 1
            dynamicBtn.cornerRadius = 10
            
            dynamicBtn.setTitle("+", for: UIControl.State.normal)
            dynamicBtn.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
            dynamicBtn.frame = CGRect(x: btnX, y: btnY, width: 343, height: 161)
            self.scrollView.addSubview(dynamicBtn)
        } else {
            
            for i in 0..<plans.count {
                // Label
                let dynamicLbl = UILabel()
                dynamicLbl.text = plans[i][0]
                dynamicLbl.textColor = UIColor.lightGray
                dynamicLbl.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 0.1))
                dynamicLbl.frame = CGRect(x: lblX, y: lblY, width: 200, height: 21)
                self.scrollView.addSubview(dynamicLbl)
                
                // Buttion
                let dynamicBtn = PlanButton()
                dynamicBtn.borderColor = UIColor.lightGray
                dynamicBtn.borderWidth = 1
                dynamicBtn.cornerRadius = 10
                
                dynamicBtn.clipsToBounds = true
                let bgImg: UIImage? = UIImage(named: plans[i][1])
                dynamicBtn.setBackgroundImage(bgImg, for: UIControl.State.normal)
                dynamicBtn.frame = CGRect(x: btnX, y: btnY, width: 343, height: 161)
                self.scrollView.addSubview(dynamicBtn)
                
                lblY += 210
                btnY += 210
            }
        }
        
        scrollView.contentSize = CGSize(width: btnX, height: btnY)
    }

}

