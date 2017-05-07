//
//  DetailStudentViewController.swift
//  ManagementStudent
//
//  Created by Thiện Huỳnh on 5/7/17.
//  Copyright © 2017 Thiện Huỳnh. All rights reserved.
//

import UIKit

class DetailStudentViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var universityTextField: UITextField!
    @IBOutlet weak var yearOldTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var student: Student?
    override func viewDidLoad() {
        super.viewDidLoad()
        didSet()
        // Do any additional setup after loading the view.
    }

    func setAdapter(student: Student) {
        self.student = student
    }
    
    func didSet() {
        nameTextField.text = student?.name
        universityTextField.text = student?.university
        yearOldTextField.text = String(student!.yearOld)
        descriptionTextView.text = student?.description
    }
    
}
