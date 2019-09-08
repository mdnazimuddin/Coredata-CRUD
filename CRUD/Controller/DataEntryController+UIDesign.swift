//
//  DataEntryController+UIDesign.swift
//  CRUD
//
//  Created by Nazim Uddin on 9/9/19.
//  Copyright © 2019 Nazim Uddin. All rights reserved.
//

import UIKit

extension DataEntryController
{
    func setupNameTextFieldConstraints()
    {
        //need x,y,width,hight anchors
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    func setupAddressTextFieldConstraints()
    {
        //need x,y,width,hight anchors
        addressTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addressTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15).isActive = true
        addressTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        addressTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        addressTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    func setupCityTextFieldConstraints()
    {
        //need x,y,width,hight anchors
        cityTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityTextField.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 15).isActive = true
        cityTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        cityTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        cityTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    func setupMobileTextFieldConstraints()
    {
        //need x,y,width,hight anchors
        mobileTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mobileTextField.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 15).isActive = true
        mobileTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        mobileTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        mobileTextField.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    func setupSaveButtonTextFieldConstraints()
    {
        //need x,y,width,hight anchors
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.topAnchor.constraint(equalTo: mobileTextField.bottomAnchor, constant: 25).isActive = true
        saveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        saveButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    func setupShowButtonTextFieldConstraints()
    {
        //need x,y,width,hight anchors
        showButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        showButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
    }
    func setupClearButtonTextFieldConstraints()
    {
        //need x,y,width,hight anchors
        clearButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        clearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
    }
    func setupSeparatViewConstraints(separatView:UIView,bottomAnchor:NSLayoutAnchor<NSLayoutYAxisAnchor>)
    {
        
        view.addSubview(separatView)
        //need x,y,width,hight anchors
        
        separatView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        separatView.topAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        separatView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        separatView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        separatView.heightAnchor.constraint(equalToConstant: 0.80).isActive = true
    }
    
}
