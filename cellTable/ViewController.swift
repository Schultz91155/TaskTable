//
//  ViewController.swift
//  cellTable
//
//  Created by admin on 17.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var contactsList = [Task]()
   
    
    let tableView : UITableView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTable()
        tableView.register(NewTableViewCell.self, forCellReuseIdentifier: "NewTableViewCell")
        tableView.dataSource = self
        tableView.delegate   = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCell))
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contactsList = Source.storage.tasks
        tableView.reloadData()
    }
    
    func getContacts (contacts : [Task]) -> [[Task]]{
        
        
        let daily = contacts.filter{ $0.taskType == "daily"}
        let weekly = contacts.filter{ $0.taskType == "weekly"}

     
        return[daily,weekly]
        
    }
    
    
    @objc func addCell(){
        let detailsVC = DetailsViewController()
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    



}

extension ViewController{
    func setupTable(){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        
    }
}

extension ViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        getContacts(contacts: contactsList).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0: return "daily"
        case 1: return "weekly"
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getContacts(contacts: contactsList)[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath) as? NewTableViewCell else{
            fatalError()
        }
        cell.configure(contact: getContacts(contacts: contactsList)[indexPath.section][indexPath.row])
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate{
    
}

 

