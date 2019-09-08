//
//  ShowDataController.swift
//  CRUD
//
//  Created by Nazim Uddin on 9/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class ShowDataController: UITableViewController {

    var students = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
     //   Color.backgroundGradient(view: self.view)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: String.cancelTitle, style: .plain, target: self, action: #selector(handleCancel))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // get student data
        students = DatabaseManager.shareInstance.getStudentData()
        
        
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
        var cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let student = students[indexPath.row]
        cell.textLabel?.text = student.name!
        cell.detailTextLabel?.text = student.city!
        return cell
    }
}
