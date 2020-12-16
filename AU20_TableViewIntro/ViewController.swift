//
//  ViewController.swift
//  AU20_TableViewIntro
//
//  Created by David Svensson on 2020-12-16.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
    
    @IBOutlet weak var personTableView: UITableView!

    let personCellId = "personCellId"
    
    let persons = Persons()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personTableView.dataSource = self
        
        let personCell = UINib(nibName: "PersonTableViewCell", bundle: nil)
        
        personTableView.register(personCell, forCellReuseIdentifier: personCellId)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Person", message: "Add a new persons name and age", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            
            guard let textField = alert.textFields?.first else { return}
            guard let name = textField.text else {return}
            if name == "" {return}
            
            guard let ageField = alert.textFields?[1] else {return}
            guard let age = ageField.text else {return}
            guard let ageInt = Int(age) else {return}
            
            self.persons.add(person: Person(name: name, age: ageInt))
            self.personTableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        alert.addTextField { textField in
            textField.placeholder = "Name"
            textField.autocapitalizationType = .words
        }
        alert.addTextField { textField in
            textField.placeholder = "Age"
        }
        
        present(alert, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: personCellId, for: indexPath) as! PersonTableViewCell
        
        let person = persons.get(atIndex: indexPath.row)
        cell.nameLabel.text = person.name
        cell.ageLabel.text = String(person.age)
        
        return cell
    }


}

