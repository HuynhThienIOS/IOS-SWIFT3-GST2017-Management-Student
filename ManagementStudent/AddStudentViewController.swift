//
//  AddStudentViewController.swift
//  ManagementStudent
//
//  Created by Thiện Huỳnh on 5/8/17.
//  Copyright © 2017 Thiện Huỳnh. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var universityTextField: UITextField!
    @IBOutlet weak var yearOldTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var studentAdapter: StudentAdapter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.yearOldTextField.delegate = self
        self.universityTextField.delegate = self
        yearOldTextField.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view.
    }
    
    func setAdapter(studentAdapter: StudentAdapter) {
        self.studentAdapter = studentAdapter
    }
    
    // Dismiss the keyboard when the user taps the "Return" key or its equivalent
    // while editing a text field.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func userTappedBackground(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func saveButtonAction(_ sender: Any) {
        if nameTextField.text != "" && universityTextField.text != "" && yearOldTextField.text != "" && descriptionTextView.text != "" {

            // add student
            studentAdapter?.students.append(Student(name: nameTextField.text!,
                                                    university: universityTextField.text!,
                                                    description: descriptionTextView.text,
                                                    yearOld: Int(yearOldTextField.text!)!))
            // alert
            let alert = UIAlertController(title: "Notification", message: "Saved!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            // clear text
            nameTextField.text = ""
            descriptionTextView.text = ""
            universityTextField.text = ""
            yearOldTextField.text = ""
        }
    }
}
