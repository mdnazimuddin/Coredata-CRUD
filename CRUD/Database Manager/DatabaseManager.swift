//
//  DatabaseManager.swift
//  CRUD
//
//  Created by Nazim Uddin on 9/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit
import CoreData

class DatabaseManager {
    static let shareInstance = DatabaseManager()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object: [String:String])  {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        student.name = object["name"]
        student.address = object["address"]
        student.city = object["city"]
        student.mobile = object["mobile"]
        do{
            try context?.save()
        }catch{
            print("Data is not Save")
        }
    }
    func getStudentData() -> [Student] {
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do{
            student = try context?.fetch(fetchRequest) as! [Student]
        }catch{
            print("Can`t get Data")
        }
        return student
    }
    func deleteStudentData(index:Int) -> [Student] {
        var student = getStudentData()
        context?.delete(student[index])
        student.remove(at: index)
        do{
            try context?.save()
        }catch{
            print("Can`t deleted data")
        }
        return student
    }
    func editStudentData(object:[String:String], index:Int) -> [Student]{
        let student = getStudentData()
        student[index].name = object["name"]
        student[index].address = object["address"]
        student[index].city = object["city"]
        student[index].mobile = object["mobile"]
        do{
            try context?.save()
        }catch{
            print("Data Don`t Edit")
        }
        return student
    }
    
}
