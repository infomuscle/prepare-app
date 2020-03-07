//
//  PlanAddViewController.swift
//  Prepare
//
//  Created by 정보근 on 2020/03/07.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
//

import UIKit

protocol SaveDelegate {
    func didSave(_ controller: PlanAddViewController, plan: PlanInfo)
}

class PlanAddViewController: UIViewController {

    
    @IBOutlet var planTitle: UILabel!
    @IBOutlet var tfTitle: UITextField!
    
    
    var delegate: SaveDelegate?
    var plansCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePlan(_ sender: UIBarButtonItem) {
        
        let planInfo = PlanInfo()
        
        planInfo.title = tfTitle.text
        
        if plansCount != nil {
            
            let imgNo = (plansCount!%5)
            let img = "bg-00" + String(imgNo+1) + ".jpg"
            planInfo.img = img
        }
        
        if delegate != nil {
            delegate?.didSave(self, plan: planInfo)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
