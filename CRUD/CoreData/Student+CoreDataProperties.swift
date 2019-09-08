//
//  Student+CoreDataProperties.swift
//  CRUD
//
//  Created by Nazim Uddin on 8/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var mobile: String?

}
