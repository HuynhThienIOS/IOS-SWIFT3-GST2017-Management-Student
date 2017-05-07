//
//  Student.swift
//  ManagementStudent
//
//  Created by Thiện Huỳnh on 5/7/17.
//  Copyright © 2017 Thiện Huỳnh. All rights reserved.
//

import Foundation

class Student {
    var name: String
    var university: String
    var description: String
    var yearOld: Int
    
    init(name: String, university: String, description: String, yearOld: Int) {
        self.name = name
        self.description = description
        self.university = university
        self.yearOld = yearOld
    }
    
    func getSomeStudent() -> [Student] {
        return [Student(name: "Huỳnh Tấn Thiện", university: "SPKT", description: "Đẹp trai con nhà giàu học giỏi", yearOld: 21), Student(name: "Huỳnh Tấn Thiện", university: "SPKT", description: "Đẹp trai con nhà giàu học giỏi", yearOld: 21), Student(name: "Huỳnh Tấn Thiện", university: "SPKT", description: "Đẹp trai con nhà giàu học giỏi", yearOld: 21),Student(name: "Huỳnh Tấn Thiện", university: "SPKT", description: "Đẹp trai con nhà giàu học giỏi", yearOld: 21), Student(name: "Huỳnh Tấn Thiện", university: "SPKT", description: "Đẹp trai con nhà giàu học giỏi", yearOld: 21), Student(name: "Huỳnh Tấn Thiện", university: "SPKT", description: "Đẹp trai con nhà giàu học giỏi", yearOld: 21)]
    }
}
