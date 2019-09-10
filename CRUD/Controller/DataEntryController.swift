//
//  ViewController.swift
//  CRUD
//
//  Created by Nazim Uddin on 8/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

class DataEntryController: UIViewController {
    
    // UI DESIGN
    let nameTextField:UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: String.placeholderName, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let addressTextField:UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: String.placeholderAddress, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let cityTextField:UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: String.placeholderCity, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let mobileTextField:UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor.white
        textField.attributedPlaceholder = NSAttributedString(string: String.placeholderMobile, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    let saveButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle(String.saveTitle, for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 20
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let showButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle(String.showTitle, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.addTarget(self, action: #selector(handleShowButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let clearButton:UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle(String.clearTitle, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        btn.addTarget(self, action: #selector(handleClearButton), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let nameSeparatView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let addressSeparatView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let citySeparatView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let mobileSeparatView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var editStatus:Bool = false
    var index:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // VIEW SETUP
        Color.backgroundGradient(view: self.view)
        
        view.addSubview(nameTextField)
        view.addSubview(addressTextField)
        view.addSubview(cityTextField)
        view.addSubview(mobileTextField)
        view.addSubview(saveButton)
        view.addSubview(clearButton)
        view.addSubview(showButton)
        
        // UI DESIDN & SETUP CONSTRAINTS
        self.callUIDesignConstraints()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    func callUIDesignConstraints(){
        self.setupNameTextFieldConstraints()
        self.setupSeparatViewConstraints(separatView: nameSeparatView, bottomAnchor: nameTextField.bottomAnchor)
        
        self.setupAddressTextFieldConstraints()
        self.setupSeparatViewConstraints(separatView: addressSeparatView, bottomAnchor: addressTextField.bottomAnchor)
        
        self.setupCityTextFieldConstraints()
        self.setupSeparatViewConstraints(separatView: citySeparatView, bottomAnchor: cityTextField.bottomAnchor)
        
        self.setupMobileTextFieldConstraints()
        self.setupSeparatViewConstraints(separatView: mobileSeparatView, bottomAnchor: mobileTextField.bottomAnchor)
        
        self.setupSaveButtonTextFieldConstraints()
        self.setupShowButtonTextFieldConstraints()
        self.setupClearButtonTextFieldConstraints()
    }
    

}
extension DataEntryController:ShowDataControllerDelegat
{
    func showDataController(editStatus:Bool,didEdit object: [String : String], index:Int) {
        self.nameTextField.text = object["name"]
        self.addressTextField.text = object["address"]
        self.cityTextField.text = object["city"]
        self.mobileTextField.text = object["mobile"]
        self.saveButton.setTitle("UPDATE", for: .normal)
        
        self.editStatus = editStatus
        self.index = index
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSaveButton(){
        guard let name = nameTextField.text else {return}
        guard let address = addressTextField.text else {return}
        guard let city = cityTextField.text else {return}
        guard let mobile = mobileTextField.text else {return}
        let dic = ["name":name,"address":address,"city":city,"mobile":mobile]
        if editStatus {
            print("Edit Database!")
            DatabaseManager.shareInstance.editStudentData(object: dic , index: index)
        }else {
            DatabaseManager.shareInstance.save(object: dic)
            handleClearButton()
        }
    }
    @objc func handleShowButton(){
        let showdataController = ShowDataController()
        showdataController.delegat = self
        let navController = UINavigationController(rootViewController: showdataController)
        present(navController,animated: true)
    }
    @objc func handleClearButton(){
        self.nameTextField.text = ""
        self.addressTextField.text = ""
        self.cityTextField.text = ""
        self.mobileTextField.text = ""
        self.saveButton.setTitle(String.saveTitle, for: .normal)
    }

}
