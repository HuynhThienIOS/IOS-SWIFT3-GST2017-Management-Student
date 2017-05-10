//
//  AddStudentViewController.swift
//  ManagementStudent
//
//  Created by Thiện Huỳnh on 5/8/17.
//  Copyright © 2017 Thiện Huỳnh. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var universityTextField: UITextField!
    @IBOutlet weak var yearOldTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var isActiveField: UITextField?
    var isActiveTextView: UITextView?
    var studentAdapter: StudentAdapter?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.yearOldTextField.delegate = self
        self.universityTextField.delegate = self
        self.descriptionTextView.delegate = self
        yearOldTextField.keyboardType = UIKeyboardType.numberPad
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
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
    
    // move content under keyboard
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.isActiveField = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.isActiveField = textField
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        self.isActiveTextView = nil
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.isActiveTextView = textView
    }
    
    func keyboardWillShow(notification: NSNotification) {
        print(notification.name)
        if isActiveField != nil {
            if let activeField = self.isActiveField, let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
                
                self.scrollView.contentInset = contentInsets
                self.scrollView.scrollIndicatorInsets = contentInsets
                var aRect = self.view.frame
                aRect.origin.y += -64
                aRect.size.height -= keyboardSize.size.height
                if (!aRect.contains(activeField.frame.origin)) {
                    self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
                }
            }
        }
        if isActiveTextView != nil {
            if let activeTextView = self.isActiveTextView, let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
                
                self.scrollView.contentInset = contentInsets
                self.scrollView.scrollIndicatorInsets = contentInsets
                var aRect = self.view.frame
                aRect.origin.y += -64
                aRect.size.height -= keyboardSize.size.height
                if (!aRect.contains(activeTextView.frame.origin)) {
                    self.scrollView.scrollRectToVisible(activeTextView.frame, animated: true)
                }
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
}
