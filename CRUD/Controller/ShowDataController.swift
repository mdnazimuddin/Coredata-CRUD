//
//  ShowDataController.swift
//  CRUD
//
//  Created by Nazim Uddin on 9/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

protocol ShowDataControllerDelegat {
    func showDataController(editStatus:Bool,didEdit object:[String:String],index:Int)
}
class ShowDataController: UITableViewController,UISearchControllerDelegate,UISearchBarDelegate {

    var students = [Student]()
    var delegat:ShowDataControllerDelegat! = nil
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
       // Color.backgroundGradient(view: self.view)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: String.cancelTitle, style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.title = "Student Info"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(StudentCell.self, forCellReuseIdentifier: "cell")
        // get student data
        students = DatabaseManager.shareInstance.getStudentData()
        
        //setup search bar
        self.setupSearchBar()
        
    }
    func setupSearchBar(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
//    override func willMove(toParent parent: UIViewController?) {
//        UINavigationBar.appearance().tintColor = .white
//       // UINavigationBar.appearance().backgroundColor = UIColor.red
//        navigationController?.navigationBar.barTintColor = .red
//    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }

}
extension ShowDataController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:StudentCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StudentCell
        let student = students[indexPath.row]
        cell.student = student
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            students = DatabaseManager.shareInstance.deleteStudentData(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = students[indexPath.row]
        let dic = ["name":student.name,"address":student.address,"city":student.city,"mobile":student.mobile]
        delegat.showDataController(editStatus: true, didEdit: dic as! [String : String], index:indexPath.row)
    }
    
}
extension ShowDataController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        if searchText == "" {
            students = DatabaseManager.shareInstance.getStudentData()
        }else{
            students = DatabaseManager.shareInstance.getStudentData()
            students = students.filter({ (student) -> Bool in
                return (student.name?.lowercased().contains(searchText.lowercased()))!
            })
            print(searchText)
        }
        tableView.reloadData()
    }
    
    
}
