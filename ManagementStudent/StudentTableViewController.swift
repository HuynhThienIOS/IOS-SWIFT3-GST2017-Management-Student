//
//  StudentTableViewController.swift
//  ManagementStudent
//
//  Created by Thiện Huỳnh on 5/7/17.
//  Copyright © 2017 Thiện Huỳnh. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
    
    var studentAdapter = StudentAdapter()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredStudent = StudentAdapter()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // search controller
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredStudent.students.count
        }
        return studentAdapter.students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentTableViewCell
        
        let student: Student
        if searchController.isActive && searchController.searchBar.text != "" {
            student = filteredStudent.students[indexPath.row]
        } else {
            student = studentAdapter.students[indexPath.row]
        }
        cell.studentNameLabel.text = student.name
        cell.studentDescriptionLabel.text = student.description
        
        // Configure the cell...

        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let indentifier = segue.identifier {
            switch indentifier {
            case "ShowStudentDetail":
                let detailStudent = segue.destination as! DetailStudentViewController
                if let indexPath = self.tableView!.indexPath(for: sender as! StudentTableViewCell) {
                    let student: Student
                    if searchController.isActive && searchController.searchBar.text != "" {
                        student = filteredStudent.students[indexPath.row]
                    } else {
                        student = studentAdapter.students[indexPath.row]
                    }
                    detailStudent.setAdapter(student: student)
                }
                case "AddStudent":
                let addStudent = segue.destination as! AddStudentViewController
                
                addStudent.setAdapter(studentAdapter: studentAdapter)
            default:
                break
            }
        }
    }
    
    
    // MARK: - Helper Method
    func filterContentForSearchText(searchText: String) {
        filteredStudent.students = studentAdapter.students.filter { student in
            return  student.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if !searchController.isActive && searchController.searchBar.text == "" {
                studentAdapter.students.remove(at: indexPath.row)
                tableView.reloadData()
            }
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
 

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
 
    
}

extension StudentTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!) }
}

extension StudentTableViewController: UISearchBarDelegate {
    func searchBar(searchBar: UISearchBar) {
        filterContentForSearchText(searchText: searchBar.text!)
    }
}
