//
//  StudentCell.swift
//  CRUD
//
//  Created by Nazim Uddin on 9/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    var student:Student!{
        didSet{
            textLabel!.text = student.name
            detailTextLabel!.text = student.city
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
