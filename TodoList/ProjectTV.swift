//
//  ProjectTV.swift
//  Project
//
//  Created by Sherzod on 10/03/22.
//

import UIKit
import RealmSwift

class ProjectTV: UIViewController {
   
    
    var data:[TaskDM] = []
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        }
    }
    
    var realm: Realm!
    override func viewDidLoad() {
        super.viewDidLoad()

        realm = try! Realm()
        self.data = realm.objects(TaskDM.self).compactMap{$0}
        print(self.data = realm.objects(TaskDM.self).compactMap{$0})
        self.tableView.reloadData()
    }

}

extension ProjectTV: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.updateCell(task: data[indexPath.row])
        
        return cell
    }
}
