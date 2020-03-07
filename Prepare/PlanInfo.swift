//
//  PlanInfo.swift
//  Prepare
//
//  Created by 정보근 on 2020/03/07.
//  Copyright © 2020 Bokeun Jeong. All rights reserved.
//

import Foundation

class PlanInfo {
    var title: String?
    var img: String?
    
    var ctgList: [Category] = []
    
    class Category {
        var ctgName: String?
        
        var itemList: [Item] = []
    }
    
    class Item {
        
        var prepared: Bool?
        var itemName: String?
        var memo: String?
    }
}
