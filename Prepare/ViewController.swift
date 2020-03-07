//
//  ViewController.swift
//  Prepare
//
//  Created by 정보근 on 2020/03/04.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SaveDelegate {
    
    // UI Variables
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var mainNavBar: UINavigationItem!
    
    // Logic Variables
    var plans: [PlanInfo] = []
    
    // Plan button location value
    let lblX: CGFloat = 16
    var lblY: CGFloat = 15
    let btnX: CGFloat = 16
    var btnY: CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Bar Setting
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.title = "PREPARE"
        
        // Load plan data from database and add them plans array.
        let sample = ["Los Angeles", "Las Vegas"]
        
        for i in 0..<sample.count {
            let planInfo = PlanInfo()
            
            planInfo.title = sample[i]
            
            planInfo.img = "bg-00" + String(i+1) + ".jpg"
            plans.append(planInfo)
        }
        
        // Case: No Plan Data
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
        }
        
        // Case: Plan Data
        else {
            
            for i in 0..<plans.count {
                // Label
                let dynamicLbl = UILabel()
                dynamicLbl.text = plans[i].title!
                dynamicLbl.textColor = UIColor.lightGray
                dynamicLbl.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 0.1))
                dynamicLbl.frame = CGRect(x: lblX, y: lblY, width: 200, height: 21)
                self.scrollView.addSubview(dynamicLbl)
                
                // Button
                let dynamicBtn = PlanButton()
                dynamicBtn.borderColor = UIColor.lightGray
                dynamicBtn.borderWidth = 1
                dynamicBtn.cornerRadius = 10
                
                dynamicBtn.clipsToBounds = true
                let bgImg: UIImage? = UIImage(named: plans[i].img!)
                dynamicBtn.setBackgroundImage(bgImg, for: UIControl.State.normal)
                dynamicBtn.frame = CGRect(x: btnX, y: btnY, width: 343, height: 161)
                self.scrollView.addSubview(dynamicBtn)
                
                lblY += 210
                btnY += 210
            }
        }
        
        scrollView.contentSize = CGSize(width: btnX, height: btnY)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let planAddViewController = segue.destination as! PlanAddViewController
        planAddViewController.delegate = self
        planAddViewController.plansCount = plans.count
    }
    
    func didSave(_ controller: PlanAddViewController, plan: PlanInfo) {
        plans.append(plan)
        addPlanButton(plan: plan)
    }
    
    func addPlanButton(plan: PlanInfo) {
        // Label
        let dynamicLbl = UILabel()
        dynamicLbl.text = plan.title!
        dynamicLbl.textColor = UIColor.lightGray
        dynamicLbl.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 0.1))
        dynamicLbl.frame = CGRect(x: lblX, y: lblY, width: 200, height: 21)
        self.scrollView.addSubview(dynamicLbl)

        // Button
        let dynamicBtn = PlanButton()
        dynamicBtn.borderColor = UIColor.lightGray
        dynamicBtn.borderWidth = 1
        dynamicBtn.cornerRadius = 10

        dynamicBtn.clipsToBounds = true
        let bgImg: UIImage? = UIImage(named: plan.img!)
        dynamicBtn.setBackgroundImage(bgImg, for: UIControl.State.normal)
        dynamicBtn.frame = CGRect(x: btnX, y: btnY, width: 343, height: 161)
        self.scrollView.addSubview(dynamicBtn)

        lblY += 210
        btnY += 210

        scrollView.contentSize = CGSize(width: btnX, height: btnY)
    }
}
