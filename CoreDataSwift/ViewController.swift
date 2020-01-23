//
//  ViewController.swift
//  CoreDataSwift
//
//  Created by U.M. Hamidul islam on 1/23/20.
//  Copyright © 2020 SH Hridoy. All rights reserved.
//

import UIKit
import  CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameinp: UITextField!
    @IBOutlet weak var ageinp: UITextField!
    var people = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers()
            
    }
 
        
 

    @IBAction func Post(_ sender: Any) {
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        alert.addTextField { (nameinp) in
        nameinp.placeholder = "Name"
        }
        alert.addTextField { (ageinp) in
            ageinp.placeholder = "Age"
            ageinp.keyboardType = .numberPad
 
        }
        let action = UIAlertAction(title: "Post", style: .default) { (_) in
            let name = alert.textFields!.first!.text!
            let age = alert.textFields!.last!.text!
            
            print(name)
            print(age)
            let person = Person(context: PersistenceServce.context)
            person.name = name
            person.age = Int16(age)!
            PersistenceServce.saveContext()
            self.people.append(person)
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func shownumbers(_ sender: Any) {
        
        showNumbers()
        
    }
    
    
    func showNumbers()  {
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do{
            let people = try PersistenceServce.context.fetch(fetchRequest)
            self.people = people
            print(people.count)
            
        }catch{
            print("error loading data")
        }
        
    }
    
    
}

