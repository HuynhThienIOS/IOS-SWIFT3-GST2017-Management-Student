//
//  DetailStudentViewController.swift
//  ManagementStudent
//
//  Created by Thiện Huỳnh on 5/7/17.
//  Copyright © 2017 Thiện Huỳnh. All rights reserved.
//

import UIKit

class DetailStudentViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var universityTextField: UITextField!
    @IBOutlet weak var yearOldTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    

    var student: Student?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.yearOldTextField.delegate = self
        self.universityTextField.delegate = self
        yearOldTextField.keyboardType = UIKeyboardType.numberPad
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
    
    @IBAction func saveButtonAction(_ sender: Any) {
        if nameTextField.text != "" && universityTextField.text != "" && yearOldTextField.text != "" && descriptionTextView.text != "" {
            //set value
            student?.name = nameTextField.text!
            student?.description = descriptionTextView.text!
            student?.yearOld = Int(yearOldTextField.text!)!
            student?.university = universityTextField.text!
            //alert
            let alert = UIAlertController(title: "Notification", message: "Saved!", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
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
    
}
