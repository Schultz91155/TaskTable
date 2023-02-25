//
//  DetailsViewController.swift
//  cellTable
//
//  Created by admin on 17.02.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var selectedTask : String?
    //var contacts = Source.storage.contacts
    

    
    let taskType : [String] = ["daily", "weekly"]

    
    
    var taskNameTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Input task name"
        return textField
    }()
    
    var  taskDescriptionTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Input task description"
        return textField
    }()
    
    
    var TaskTypetextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Select task type"
        return textField
    }()
    
    var createButton : UIButton = {
        let buttton = UIButton()
        buttton.translatesAutoresizingMaskIntoConstraints = false
        buttton.layer.borderWidth = 1
        buttton.layer.cornerRadius = 5
        buttton.setTitle("Create task", for: .normal)
        buttton.setTitleColor(.black, for: .normal)
        buttton.addTarget(self, action: #selector(createTask), for: .touchUpInside)
        return buttton
        
    }()
    
   
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupView()
        createAndSetupPickerView()
        dismissAndClousePickerView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(gesture)
    }
    
    
    func setupView (){
        
        view.addSubview(TaskTypetextField)
        view.addSubview(taskNameTextField)
        view.addSubview(taskDescriptionTextField)
        view.addSubview(createButton)
     
        NSLayoutConstraint.activate([
            
            taskNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            taskNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            taskNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            taskNameTextField.heightAnchor.constraint(equalToConstant: 30),
            
            taskDescriptionTextField.topAnchor.constraint(equalTo: taskNameTextField.topAnchor, constant: 50),
            taskDescriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            taskDescriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            taskDescriptionTextField.heightAnchor.constraint(equalToConstant: 30),
            
            TaskTypetextField.topAnchor.constraint(equalTo: taskDescriptionTextField.topAnchor, constant: 50),
            TaskTypetextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            TaskTypetextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            TaskTypetextField.heightAnchor.constraint(equalToConstant: 30),
            
            
            
            
            
            createButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100),
            createButton.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    
    @objc func createTask() {
        
        
        var taskName = "non task name"
        var taskDescription = "non task decription"
        var type = "daily"
        
        if taskNameTextField.hasText{
            taskName = taskNameTextField.text!
        }
        if taskDescriptionTextField.hasText{
            taskDescription = taskNameTextField.text!
        }
        if TaskTypetextField.hasText{
            type = taskNameTextField.text!
        }
        
        let task = Task(taskName: taskName, taskDescription: taskDescription, taskType: type)
        Source.storage.tasks.append(task)
        navigationController?.popToRootViewController(animated: true)
       
    }
    
    @objc func didTap(){
        self.view.endEditing(true)
    }
    
    func createAndSetupPickerView (){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        self.TaskTypetextField.inputView = pickerView
    }
    
    func dismissAndClousePickerView(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissAction))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        self.TaskTypetextField.inputAccessoryView = toolBar
        
    }
    
    @objc func dismissAction(){
        self.view.endEditing(true)
    }

}

    
extension DetailsViewController : UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.taskType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.taskType[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedTask = self.taskType[row]
        self.TaskTypetextField.text = self.selectedTask
    }
    
    

    }
    



